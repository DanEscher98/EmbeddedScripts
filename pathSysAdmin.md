# SysAdmin learning path

## Study points for the exam

RHCSA exam candidates should be able to accomplish the tasks below
without assistance. These have been grouped into several categories.

### Understand and use essential tools

- `[x]` Access a shell prompt and issue commands with correct syntax
- `[x]` Use input-output redirection (>, >>, |, 2>, etc.)
- `[x]` Use grep and regular expressions to analyze text
- `[x]` Access remote systems using SSH
- `[x]` Log in and switch users in multiuser targets
- `[x]` Archive, compress, unpack, and uncompress files using tar, star,
    gzip, and bzip2. Create and edit text files
- `[x]` Create, delete, copy, and move files and directories
- `[x]` Create hard and soft links
- `[·]` List, set, and change standard ugo/rwx permissions
- `[x]` Locate, read, and use system documentation including man, info,
    and files in /usr/share/doc

### Create simple shell scripts

- `[x]` Conditionally execute code (use of: if, test,\  [], etc.)
- `[x]` Use Looping constructs (for, etc.) to process file, command line input
- `[x]` Process script inputs ($1, $2, etc.)
- `[x]` Processing output of shell commands within a script
- `[x]` Processing shell command exit codes

### Manage basic networking

- `[·]` Configure IPv4 and IPv6 addresses
- `[·]` Configure hostname resolution
- `[·]` Configure network services to start automatically at boot
- `[·]` Restrict network access using firewall-cmd/firewall

### Manage users and groups

- `[·]` Create, delete, and modify local user accounts
- `[·]` Change passwords and adjust password aging for local user accounts
- `[·]` Create, delete, and modify local groups and group memberships
- `[·]` Configure superuser access

### Manage security

- `[·]` Configure firewall settings using firewall-cmd/firewalld
- `[·]` Create and use file access control lists
- `[·]` Configure key-based authentication for SSH
- `[·]` Set enforcing and permissive modes for SELinux
- `[·]` List and identify SELinux file and process context
- `[·]` Restore default file contexts
- `[·]` Use boolean settings to modify system SELinux settings
- `[·]` Diagnose and address routine SELinux policy violations

### Deploy, configure, and maintain systems

- `[·]` Schedule tasks using at and cron
- `[·]` Start and stop services and configure services to start automatically
    at boot
- `[·]` Configure systems to boot into a specific target automatically
- `[·]` Configure time service clients
- `[·]` Install and update software packages from Red Hat Network, a remote
    repository, or from the local file system Work with package module
- `[·]` streams
- `[·]` Modify the system bootloader

---

### Operate running systems

- `[·]` Boot, reboot, and shut down a system normally
- `[·]` Boot systems into different targets manually
- `[·]` Interrupt the boot process in order to gain access to a system
- `[x]` Identify CPU/memory intensive processes and kill processes
- `[·]` Adjust process scheduling
- `[·]` Manage tuning profiles
- `[·]` Locate and interpret system log files and journals
- `[·]` Preserve system journals
- `[·]` Start, stop, and check the status of network services
- `[·]` Securely transfer files between systems

### Configure local storage

- `[·]` List, create, delete partitions on MBR and GPT disks
- `[·]` Create and remove physical volumes
- `[·]` Assign physical volumes to volume groups
- `[·]` Create and delete logical volumes
- `[·]` Configure systems to mount file systems at boot by universally
    unique ID (UUID) or label Add new partitions and logical volumes,
- `[·]` and swap to a system non-destructively

### Create and configure file systems

- `[x]` Create, mount, unmount, and use vfat, ext4, and xfs file systems
- `[·]` Mount and unmount network file systems using NFS
- `[·]` Extend existing logical volumes
- `[·]` Create and configure set-GID directories for collaboration
- `[·]` Configure disk compression
- `[·]` Manage layered storage
- `[·]` Diagnose and correct file permission problems

### Manage containers

- `[·]` Find and retrieve container images from a remote registry
- `[·]` Inspect container images
- `[·]` Perform container management using commands such as podman and skopeo
- `[·]` Perform basic container management such as running, starting,
    stopping, and listing running containers Run a service inside a
- `[·]` container
- `[·]` Configure a container to start automatically as a systemd service
- `[·]` Attach persistent storage to a container

As with all Red Hat performance-based exams, configurations must persist
after reboot without intervention. Processing shell command exit codes

