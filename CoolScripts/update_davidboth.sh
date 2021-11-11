#!/usr/bin/bash
###########################################################
#							doUpdates					  #
# This is a simple program to perform updates on a Linux  #
# computer. If a new kernel is installed, it will build a #
# new grub.cfg to create the recovery mode kernel boot	  #
# options, and then reboot the computer.				  #
#														  #
###########################################################


#######################################
## HELP ###############################
function Help() {
	# Display Help
	printf "doUpdates - Performs all updates, builds new GRUB2,
	and reboots if a new kernel or glibc was installed.\n"
	printf "Syntax: doUpdates --[g|h|c|V|rv]\n"
	printf "Options:
	g Print the GPL license notification.
	c Check to see if updates are available.
	h Print this Help.
	r Reboot if the kernel or glibc have been updated.
	v Verbose mode.
	V Print software version and exit."
	printf '\n'
}

#######################################
## Quit ###############################
function Quit() {
	if [ "$verbose" = 1 ]; then
		if [ $error = 0 ]; then
			echo "Program terminated normally"
		else
			echo "Program terminated with error ID $ErrorMsg";
		fi
	fi
	exit $error
}

#######################################
## Message ############################
function PrintMsg() {
	if [ "$verbose" -eq 1 ] && [ -n "$Msg" ]; then
		echo "########## $Msg ##########"
		# Set the message to null
		Msg=""
	fi
}

#######################################
## Select Package Manager #############
function SelectPkgMgr() {
	# get the Distribution, release and architecture.
	if command -v apt &> /dev/null; then
		PkgMgr="apt"
	elif command -v dnf &> /dev/null; then
		PkgMgr="dnf"
	elif command -v pacman &> /dev/null; then
		PkgMgr="pacman"
	else
		Msg="Unable to define the Package Manager."
		error=7
		Quit $error
	fi
	Msg="Using $PkgMgr Package Manager"
	Print_Msg
}

#######################################
## Get Distro and Architecture ########
function GetDistroArch() {
	# Get the host physical architecture
	HostArch=`echo $HOSTTYPE | tr [:lower:] [:upper:]`
	Msg="The host physical architecture is $HostArch"
	PrintMsg
	#----------------------------------------------------------
	# Get some information from the *-release file. We care
	# about this to give us Fedora or CentOS version number and
	# because some group names change between release levels.
	#----------------------------------------------------------
	# First get the distro info out of the file in a way that
	# produces consistent results. Due to the different ways
	# distros keep info in the release files we have to do this
	# a bit harder than we would otherwise. Switch to /etc
	cd /etc
	# Start by looking for Fedora
	if grep -q -i "fedora" /etc/os-release ; then
		# This is Fedora
		NAME="Fedora"
		# Define the Distribution
		Distro=`grep PRETTY_NAME os-release \
			| awk -F= '{print $2}' | sed -e "s/\"//g"`
		# Get the full release number
		FULL_RELEASE=`grep VERSION_ID os-release | awk -F= '{print $2}'`
		# The Release version is the same as the full release number,
		# i.e., no minor versions for Fedora
		RELEASE=$FULL_RELEASE
		#---------------------------------------------------------
		# Verify Fedora release $MinFedoraRelease= or above. This
		# is due to the lack of Fedora and Fusion repositories
		# prior to that release.
		#---------------------------------------------------------
		if [ $RELEASE -lt $MinFedoraRelease ]; then
			Msg="Release $RELEASE of Fedora is not supported. Only releases
			$MinFedoraRelease and above are supported."
			PrintMsg
			error=2
			Quit $error
		fi
	elif grep -q -i "centos" /etc/os-release ; then
		# This is CentOS
		NAME="CentOS"
		Distro=`cat centos-release`
		# Get the full release number
		FULL_RELEASE=`echo $Distro | sed -e "s/[a-zA-Z() ]//g"`
		# Get the CentOS major version number
		RELEASE=`echo $FULL_RELEASE | awk -F. '{print $1}'`
		#---------------------------------------------------------
		# Verify CentOS release $MinCentOSRelease= or above. This
		# is due to the lack of testing for this program prior to
		# that release.
		#---------------------------------------------------------
		if [ $RELEASE -lt $MinCentOSRelease ]; then
			Msg="Release $RELEASE of CentOS is not supported. Only releases
			$MinCentOSRelease and above are supported."
			PrintMsg
			error=4
			Quit $error
		fi
	else
		Msg="Unsupported OS: $NAME"
		PrintMsg
		error=2
		Quit $error
	fi
	Msg="Distribution = $Distro"
	PrintMsg
	Msg="Name = $NAME Release = $RELEASE Full Release = $FULL_RELEASE"
	PrintMsg
	# Now lets find whether Distro is 32 or 64 bit
	if uname -m | grep -q -i "x86"; then
		# Just the bits
		Arch="64"
	else
		# Just the bits
		Arch="32"
	fi
	if [ $verbose = 1 ]; then
		Msg="This is a $Arch bit version of the Linux Kernel."
		PrintMsg
	fi
}

##########################################################
## Main program ##########################################
# Set initial variables
badoption=0
check=0
doReboot=0
error=0
MinCentOSRelease="6"
MinFedoraRelease="22"
NeedsReboot=0
newKernel=0
newglibc=0
PkgMgr="dnf"
RC=0
UpdatesAvailable=0
verbose=0
version=01.02.03
#----------------------------------------------------------
# Check for root
if [ `id -u` != 0 ]; then
	echo ""
	echo "You must be root user to run this program"
	echo ""
	Quit 1
fi
###########################################################
## Process the input options ##############################
# Get the options
while getopts ":gchrvV" option; do
	case $option in
	g) gpl; Quit;;						# display GPL
	v) verbose=1;;						# Set verbose mode
	V) echo "Version = $version"; Quit;;# Set verbose mode
	c) verbose=1; check=1;;				# Check option
	r) doReboot=1;;						# Reboot option
	h) Help; Quit;;						# display Help
	\?) badoption=1;;					# incorrect option
	esac
done
if [ $badoption = 1 ]; then
	echo "ERROR: Invalid option"
	Help
	verbose=1
	error=1
	ErrorMsg="10T"
	Quit $error
fi

# What package manager should we be using?
SelectPkgMgr
# Are updates available? Just quit with message if not
# RC from dnf check-update = 100 if available and 0 if none available.
$PkgMgr check-update > /dev/null
UpdatesAvailable=$?
if [ $UpdatesAvailable = 0 ]; then
	Msg="Updates are NOT available for host $HOSTNAME at this time."
	# Turn on verbose so message will print
	verbose=1
	PrintMsg
	Quit
else
	Msg="Updates ARE available for host $HOSTNAME."
	# Turn on verbose so message will print
	PrintMsg
fi
# Does the update include a new kernel
if $PkgMgr check-update | grep ^kernel > /dev/null; then
	newKernel=1
	NeedsReboot=1
fi
# Or is there a new glibc
if $PkgMgr check-update | grep ^glibc > /dev/null; then
	newglibc=1
	NeedsReboot=1
fi
# Are we checking or doing?
if [ $check = 1 ]; then
	# Checking: Report results and quit
	if [ $NeedsReboot = 1 ]; then
		Msg="A reboot will be required after these updates are installed."
		PrintMsg
	else
		Msg="A reboot will NOT be required after these updates are installed."
		PrintMsg
	fi
	Quit
else
	# Do the update
	$PkgMgr -y update
	# Preserve the return code
	RC=$?
	# Message and quit if error =3 occurred
	if [ $RC -eq 1 ]; then
		Msg="An error ocuurred during the update but it was handled by $PkgMgr."
		PrintMsg
	elif [ $RC -eq 3 ]; then
		Msg="WARNING!!! An uncorrectable error ocuurred during the update."
		PrintMsg
		Quit
	fi
fi
# Update man database
mandb
# If new kernel rebuild grub.cfg and reboot
if [ $newKernel = 1 ]; then
	# Generate the new grub.cfg file
	Msg="Rebuilding the grub.cfg file on $HOSTNAME."
	PrintMsg
	grub2-mkconfig > /boot/grub2/grub.cfg
fi
if [ $doReboot = 1 ] && [ $NeedsReboot = 1 ]; then
	# reboot the computer because the kernel or glibc have been updated
	# AND the reboot option was specified.
	Msg="Rebooting $HOSTNAME."
	PrintMsg
	reboot
	# no need to quit in this fork
elif [ $doReboot = 0 ] && [ $NeedsReboot = 1 ]; then
	Msg="This system, $HOSTNAME, needs rebooted but you did not choose the -r option
	to reboot it."
	PrintMsg
	Msg="You should reboot $HOSTNAME manually at the earliest opportunity."
else
	Msg="NOT rebooting $HOSTNAME."
fi
PrintMsg
Quit
###########################################################
## End of program #########################################
###########################################################
