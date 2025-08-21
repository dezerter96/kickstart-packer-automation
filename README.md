# 🚀 Introduction 
This is a clone of the Azure DevOps repository.  
This repository is configured to build a virtual machine image that will be deployed in VirtualBox.

# 🚩 Getting Started
The goal of this project is to use the Azure DevOps platform to create a virtual machine image for VirtualBox.
Due to the limited infrastructure (home computer), the project is designed to use the smallest possible hardware resources to enable learning DevOps technologies.

Tools used for the project:
- Azure DevOps
- Packer

# 🔨 Build
##ks.cfg
The ks.cfg file is a Kickstart script that automates the installation of Rocky Linux with predefined settings. Here's a brief description of its contents:
- Installation from the CDROM in text mode
- Localization settings: Polish language, keyboard layout, and Europe/Warsaw timezone
- User configuration: root user with an encrypted password, creation of a user named "automation" with an encrypted password and passwordless sudo access
- Automatic network configuration using DHCP
- Disk partitioning with EFI, boot, LVM for system and home, and swap partitions
- Installation of minimal environment and development packages
- Addition of the EPEL repository
- Post-installation mounts the VirtualBox Guest Additions ISO and installs the additions
- Adds DNS entries to /etc/hosts
- Sets up an SSH key for the "automation" user
- Automatic reboot after installation completes
This is a complete and automated installation script with full configuration of network, users, disks, and additional tools for use in a VirtualBox environment.

##variables.pkr.hcl
The **variables.pkr.hcl** file contains definitions of the required Packer plugins for VirtualBox and Vagrant, as well as detailed configuration for building a Rocky Linux image from an ISO image. This file specifies, among other things, virtual machine parameters (e.g., number of CPUs, RAM, disk size), SSH configuration, how to launch the Kickstart installation, and exporting the finished image to a Vagrant-compatible format. This file allows you to automate the process of preparing Rocky Linux virtual machines.

##password_generator.py
The **password_generator.py** script is used to generate a hashed password using the crypt function. The user is prompted to enter a plain-text password, which is then hashed using the SHA-512 algorithm with a high number of rounds (656,000) to enhance security 🔒. The output is a hashed password in a format compatible with Linux system standards, suitable for use in configuration files for automatic user and password setup. Such a hashed password format is required in Kickstart files for secure and unattended password configuration during system installation 🖥️⚙️. This script simplifies the secure preparation of passwords for installation or system automation tasks.