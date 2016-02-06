# fastExtendSetup
Installation scripts for OpenSUSE 13.2, OpenSUSE Leap, OpenSUSE TUmbleweed and Foam-Extend-3.1

*NOTE: THIS IS FOR OpenSUSE 13.2, OpenSUSE Leap, OpenSUSE Tumbleweed and Foam-Extend-3.1 ONLY

This file will add lines to .bashrc that need to be manually removed to revert to the original install

This document describes a series of steps in order to install Foam-Extend-3.1 on OpenSuse 13.2. 

The process involves system package updates and installation of required packages, accessing the git mirror for Foam-Extend-3.1, patching the base OpenSuse 13.2 installation and the Foam-Extend-3.1 installation to allow for installation behind a firewall or in the absence of an internet connection.

REMOVE OLD INSTALLATION OF 3.1

(A) Remove any previous FOAM-Extend-3.1 Installation (IF NECESSARY)

WARNING - ONLY DO THIS IF YOU HAVE BACKED UP YOUR PREVIOUS FOAM USER DIRECTORY AND DATA

Step (1): 

rm -rf $HOME/foam

REQUIRED OPENSUSE 13.2 PACKAGES

(B) Installation of required packages and the GLFix

Step (1): git mirror this repository in $HOME/.

cd $HOME/.

git clone https://github.com/fastSimulations/fastExtendSetup.git

Step (2):

cd fastExtendSetup

Step (3):

sh fastfcOpenSuseSetup

PATCHING, THIRD-PARTY PACKAGES & COMPILATION, FOAM-EXTEND-3.1 COMPILATION

(C) Extend Setup and Patching

Step (1): 

cd $HOME/fastfcExtendSetup

Step (2):

sh fastfcExtendSetupPatching

(D) Review output compilation

Step (3):

Review compilation logs to confirm a clean installation

Step (4):

Create the user directory, if it does not already exist

cd $HOME/foam

mkdir -p $FOAM_RUN
