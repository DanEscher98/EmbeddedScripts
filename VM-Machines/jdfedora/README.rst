=================================== Automate Embedded Development Setup ===================================

Introduction
============

In order to automate the environment setup, installation of required tools and the compilation process, a `bash` and a `Powershell` scripts are provided.

Instructions
============

`VirtualBox` on Windows host
============================

Steps for native Linux system
=============================

The script will perform the following steps:

1.  Install:

    -   The **make** tool
    -   The newest **Python** version
    -   The **Haskell** interpreter and compiler
    -   Optional: **Pandoc**, to generate a `PDF` of this markup file

2.

In a Linux terminal, navigate to the directory where these files are located and type the following commands:

.. code:: bash

    git clone https://github.com/DanEscher98/Courses.git
    chmod u+x setup.sh # Change to executable mode
    sudo ./setup.sh # To install packages permission is needed

Software that will be installed ...
===================================

on the Windows host
-------------------

-   Microsoft `PowerShell` 7
-   Microsoft `Windows Terminal`
-   Oracle `VirtualBox`
-   Hashicorp `Vagrant`
-   Axosoft `GitKraken`
-   `git` and `gsudo`

on the Linux `VM`
-----------------

| "You are old, Father William," the young man said,
|     \"And your hair has become very white;
| And yet you incessantly stand on your head
|     Do you think, at your age, it is right?\"
|
| "In my youth," Father William replied to his son,
|     \"I feared it might injure the brain;
| But now that I'm perfectly sure I have none,
|     Why, I do it again and again.\"
