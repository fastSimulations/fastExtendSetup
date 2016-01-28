#! /bin/bash
set +e
clear
echo
echo "Fast-FC Setup Script for Foam-Extend-3.1"
echo

echo
echo "Download Foam Extend 3.1"
echo

mkdir $HOME/foam >/dev/null 3>&1
cd $HOME/foam
tar xvzf $HOME/fastExtendSetup/EXTEND-3.1/foam-extend-3.1.tar.gz -C $HOME/foam/.

#git clone http://git.code.sf.net/p/openfoam-extend/foam-extend-3.1 foam-extend-3.1

echo 
echo "Appending scripts to bashrc"
echo

cat $HOME/fastExtendSetup/fastfcBASHRC/bashrcAdditions >> $HOME/.bashrc
cp $HOME/fastExtendSetup/fastfcBASHRC/extendBASHRC $HOME/.extendBASHRC >/dev/null 3>&1

source $HOME/.bashrc

echo 
echo "Creating GCC 48 Compiler Options"
echo

cp -r $HOME/fastExtendSetup/extendGCC48/linux64Gcc48 $WM_PROJECT_DIR/wmake/rules/. >/dev/null 3>&1
cd $WM_PROJECT_DIR
git branch hotfix/gcc48
git checkout hotfix/gcc48


echo
echo "Creating prefs.sh"
echo
cp -r $HOME/fastExtendSetup/extendPrefs/prefs.sh $WM_PROJECT_DIR/etc/. >/dev/null 3>&1

echo
echo "Compiling the FOAM_SRC"
echo

cd $FOAM_SRC
wmakeLnIncludeAll 

echo
echo "Fixing Make File Scripts in ThirdParty Directory"
echo

cp $HOME/fastExtendSetup/fixedMakeScripts/AllMake.stage* $WM_THIRD_PARTY_DIR/. >/dev/null 3>&1

echo
echo "Copying Third Party Archives to rpmBuild"
echo

cp -r $HOME/fastExtendSetup/packageSources/SOURCES $WM_THIRD_PARTY_DIR/rpmBuild/ >/dev/null 3>&1
cp -r $HOME/fastExtendSetup/packageSources/TGZS $WM_THIRD_PARTY_DIR/rpmBuild/. > /dev/null 3>&1

echo 
echo "Compiling Third Party Packages"
echo

cd $WM_THIRD_PARTY_DIR

./AllMake.stage1 | tee $HOME/fastExtendSetup/logs/stage1.compile.log
echo 
echo "Compiled Stage 1"
echo

./AllMake.stage2 | tee $HOME/fastExtendSetup/logs/stage2.compile.log
echo 
echo "Compiled Stage 2"
echo

source $HOME/.bashrc

./AllMake.stage3 | tee $HOME/fastExtendSetup/logs/stage3.compile.log
echo 
echo "Compiled Stage 3"
echo

./AllMake.stage4 | tee $HOME/fastExtendSetup/logs/stage4.compile.log
echo 
echo "Compiled Stage 4"
echo

grep -r $HOME/fastExtendSetup/logs/*.compile.log "error"

source $HOME/.bashrc

cd $WM_PROJECT_DIR
./Allwmake.firstInstall | tee $HOME/fastExtendSetup/logs/extend.compile.log

grep -r $HOME/fastExtendSetup/logs/extend.compile.log

echo
echo "Script Ended"
