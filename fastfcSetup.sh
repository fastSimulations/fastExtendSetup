#! /bin/bash
set +e
clear
echo
echo "Fast-FC Setup Script"
echo

echo 
echo "Setting up FAST-FC, Note: This requires an internet connection and a working installation of 'git'"
cd $WM_PROJECT_USER_DIR

echo "Checking for existing FAST-FC installation"
if [ -d "$WM_PROJECT_USER_DIR/FastFC" ]
then
	echo "FAST-FC installation already exists"
	if grep -qFf $HOME/fastExtendSetup/fastfcBASHRC/bashrcFastfcAdditions $HOME/.extendBASHRC 
	then 	
		echo "Fast-FC BASHRC Additions Already Found in .extendBASHRC"
	else
		echo "Fast-FC BASHRC Additions Not Found in .extendBASHRC, ADDING:"
		cat $WM_PROJECT_USER_DIR/FastFC/etc/bashrcAdditions >> $HOME/.extendBASHRC
		echo "Done"
		echo
	fi
else
	echo
	echo "Cloning the Fast-FC Repository"
	echo
	git clone https://github.com/fastSimulations/FastFC.git

	echo
	echo "Done"
	echo

	if grep -qFf $HOME/fastExtendSetup/fastfcBASHRC/bashrcFastfcAdditions $HOME/.extendBASHRC 
	then 	
		echo "Fast-FC BASHRC Additions Already Found in .extendBASHRC"
	else
		echo "Fast-FC BASHRC Additions Not Found in .extendBASHRC, ADDING:"
		cat $HOME/fastExtendSetup/fastfcBASHRC/bashrcFastfcAdditions >> $HOME/.extendBASHRC
		echo "Done"
		echo
	fi

	cd $WM_PROJECT_USER_DIR/FastFC
	echo 
	echo "Building Fast-FC"
	./buildFastFC
	echo
	echo "Done"
	echo "Extracting Case Files"
	./extractCaseFiles
	echo
	echo "Done"
fi

echo
echo "Process Complete, please advise developers if errors are encountered: support@fastsimulations.com"
echo
echo "Script Completed"
echo
