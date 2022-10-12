FILE = dummy.c

# Pretty interface for GDB
# source: https://stackoverflow.com/a/17341335
wget -P $HOME https://git.io/.gdbinit

# Enable core dumps on linux
ulimit -c unlimited
sudo sysctl -w kernel.core_pattern=/tmp/core-%e.%p.%h.%t

# Load executable with core file
gdb $FILE -c /tmp/core

## load debugging symbols table
#$ symbol-file $FILE
#$ sharedlibrary
#$ thread apply all backtrace full


