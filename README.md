# fastExtendSetup
Installation scripts for OpenSUSE 13.2 and Foam-Extend-3.1

*NOTE: THIS IS FOR OPENSUSE 13.2 and Foam-Extend-3.1 ONLY
       This file will add lines to .bashrc that need to be manually removed to revert to the original install

This document describes a series of steps in order to install Foam-Extend-3.1 on OpenSuse 13.2. 

The process involves system package updates and installation of required packages, accessing the git mirror for Foam-Extend-3.1, patching the base OpenSuse 13.2 installation and the Foam-Extend-3.1 installation to allow for installation behind a firewall or in the absence of an internet connection.

REMOVE OLD INSTALLATION OF 3.1

(A) Remove any previous FOAM-Extend-3.1 Installation (IF NECESSARY)

Step (1): 

rm -rf $HOME/foam

REQUIRED OPENSUSE 13.2 PACKAGES

(B) Installation of required packages and the GLFix

Step (1):

git mirror this repository in $HOME/.

Step (2):

cd fastfcExtendSetup

Step (3):

sh fastfcOpenSuseSetup

PATCHING, THIRD-PARTY PACKAGES & COMPILATION, FOAM-EXTEND-3.1 COMPILATION

(C) Extend Setup and Patching

Step (1): 

cd $HOME/fastfcExtendSetup

Step (2):

sh fastfcExtendSetupPatching

(D) Review output compilation

Step (1):

Review compilation logs to confirm a clean installation

