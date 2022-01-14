# Build procedure for AMSS MSM8996.LA.2.0.3

## Requirements

* Docker
* ARM DS-5 and license (ARMCompiler 5.05u1) - https://developer.arm.com/tools-and-software/embedded/legacy-tools/ds-5-development-studio
* AMSS for MSM8996 LA.2.0.3 - qualcomm.com
* ~20GB to complete build

## Build

* Prepare the build directory 
   ```
   $ mkdir /srv/user/amss
   $ docker run --rm -it -v /srv/user/amss:/build:z ubuntu:18.04
   ```

* Unpack AMSS archive to `/srv/user/amss` directory - you will see a bunch of directories including
`rpm_proc`.

* ARM Compiler:
   * Unpack the DS-5 installer into `/srv/user/amss/tool`:
      ```
      $ cd /srv/user/amss
      $ mkdir tool ; cd tool
      $ unzip ~/Downloads/ARM\ DS\ 5\ Development\ Studio\ 5.20.2.zip
      ```
   * Run the DS-5 installer inside the docker container:
      ```
      root@34288fd1750d:/# cd /build
      root@34288fd1750d:/build# tool/install.sh --i-agree-to-the-contained-eula --no-interactive
      ```
   * Install the necessary libraries for the ARM compiler:
      ```
      root@34288fd1750d:/# dpkg --add-architecture i386 && apt update && apt install -y libasound2 libatk1.0-0 libcairo2 libgl1 libglu1-mesa libgtk2.0-0 libxt6 libxtst6 libwebkitgtk-1.0-0
      root@34288fd1750d:/# apt install -y libc6:i386 libfontconfig1:i386 libgl1:i386 libglu1-mesa:i386 libice6:i386 libncurses5:i386 libsm6:i386 libusb-0.1-4:i386 libxcursor1:i386 libxft2:i386 libxmu6:i386 libxrandr2:i386
      ```
   * Check that all the required libs are installed - the command should show `Running dependency check
   [succeeded]`:
      ```
      root@34288fd1750d:/# /usr/local/DS-5/sw/dependency_check/dependency_check_linux-x86_64.sh
      ```
   * Copy your license to the docker container in `/usr/local/DS-5/license.dat`.
   * Remove the `/build/tool` directory in docker container.

* Install python 2.7 for scons and openssl for signing:
   ```
   root@34288fd1750d:/# apt install -y python2.7 openssl && update-alternatives --install /usr/bin/python python /usr/bin/python2.7 10
   ```

* Prepare the env file and source it to use variables:
   ```
   root@34288fd1750d:/# cd /build
   root@34288fd1750d:/build# cat <<\EOF > /build/env.sh
   export ARMTOOLS=RVCT41
   export ARMROOT=/usr/local/DS-5/sw/ARMCompiler5.05u1
   export ARMBIN=$ARMROOT/bin
   export ARMINC=$ARMROOT/include
   export ARMLIB=$ARMROOT/lib
   export ARMHOME=$ARMROOT ARMPATH=$ARMBIN ARMINCLUDE=$ARMINC ARM_COMPILER_PATH=$ARMBIN
   export PATH=$ARMBIN:$PATH

   export LM_LICENSE_FILE=/usr/local/DS-5/license.dat
   EOF
   root@34288fd1750d:/build# . ./env.sh
   ```

* Build RPM - /build/rpm_proc/build/ms/bin/AAAAANAAR/signed/rpm.mbn:
   ```
   root@34288fd1750d:/# cd /build
   root@34288fd1750d:/# sh rpm_proc/build/build_8996.sh
   ```

## Flash

TODO
