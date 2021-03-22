# Build procedure for LA.UM.7.5.r1-03100-8x96.0 Android 9 + Kernel 3.18

## Requirements

* Docker
* ~200GB for complete build

## Build

* Host:
   ```
   mkdir /srv/user/android
   docker run --rm -it -v /srv/user/android:/build:z ubuntu:18.04
   ```

* Download the required binaries: [gitlab](https://gitlab.com/rabits/bins/-/tree/master/binocular/prototype_1)
* Place them in `/srv/user/android/` directory
* Unpack patches.tar.gz in the `/srv/user/android` directory (it will create `patches` directory)

* Container prepare:
   ```
   apt update && apt install -y git vim build-essential flex bison libncurses-dev openssl libssl-dev dkms libelf-dev libudev-dev libpci-dev libiberty-dev autoconf bc repo wget python3 unzip zip rsync
   git config --global user.email "you@example.com"
   git config --global user.name "Your Name"
   ```

* Container download sources:
   ```
   mkdir -p /build/open-q-820
   cd /build/open-q-820
   repo init -u git://codeaurora.org/platform/manifest.git -b release -m LA.UM.7.5.r1-03100-8x96.0.xml --repo-url=git://codeaurora.org/tools/repo.git --repo-branch=caf-stable

   # Remove "google_" prefixed repos in .repo/manifest.xml

   cp .repo/repo/repo /usr/bin/repo
   repo sync -c -j$(nproc) --no-tags --no-clone-bundle
   ```

* Container apply vendor:
   ```
   # Apply patches from 8096_Open-Q_u820__Android_BSP-P_v5.1/8096_Open-Q_820_Android_BSP-P_v5.1/Source_Package/
   ../patch.sh

   # Extract proprietary.tar.gz from 8096_Open-Q_u820__Android_BSP-P_v5.1/8096_Open-Q_820_Android_BSP-P_v5.1/Source_Package/ to vendor/qcom/
   tar -xzvf ../8096_Open-Q_u820__Android_BSP-P_v5.1/proprietary.tar.gz -C vendor/qcom/
   ```

* Container build images:
   ```
   source build/envsetup.sh
   lunch msm8996-userdebug

   # Run build images
   BUILD_NUMBER=$(date +%y%m%d%H%M%S) ITC_ID=OpenQ820_P_v5.1 make -j24
   ```

## Flash

* Host prepare:
   ```
   $ adb reboot bootloader
   ```
   ```
   $ fastboot devices -l
   277010101071910397     fastboot
    usb:3-1.1.1.1.3
   ```

* Flash partitions:
   ```
   $ fastboot flash boot /srv/user/android/open-q-820/out/target/product/msm8996/boot.img
   Sending 'boot' (55589 KB)                          OKAY [  1.574s]
   Writing 'boot'                                     OKAY [  0.552s]
   Finished. Total time: 2.256s
   ```
   ```
   $ fastboot flash cache /srv/user/android/open-q-820/out/target/product/msm8996/cache.img
   Sending 'cache' (128 KB)                           OKAY [  0.047s]
   Writing 'cache'                                    OKAY [  0.029s]
   Finished. Total time: 0.128s
   ```
   ```
   $ fastboot flash persist /srv/user/android/open-q-820/out/target/product/msm8996/persist.img
   Sending 'persist' (32768 KB)                       OKAY [  1.018s]
   Writing 'persist'                                  OKAY [  0.336s]
   Finished. Total time: 1.404s
   ```
   ```
   $ flash system /srv/user/android/open-q-820/out/target/product/msm8996/system.img
   Sending sparse 'system' 1/3 (524284 KB)            OKAY [ 15.258s]
   Writing 'system'                                   OKAY [  5.027s]
   Sending sparse 'system' 2/3 (524284 KB)            OKAY [ 15.208s]
   Writing 'system'                                   OKAY [  5.033s]
   Sending sparse 'system' 3/3 (300564 KB)            OKAY [  8.694s]
   Writing 'system'                                   OKAY [  2.901s]
   Finished. Total time: 52.167s
   ```
   ```
   $ fastboot flash userdata /srv/user/android/open-q-820/out/target/product/msm8996/userdata.img
   Sending 'userdata' (5368 KB)                       OKAY [  0.197s]
   Writing 'userdata'                                 OKAY [  0.082s]
   Finished. Total time: 0.329s
   ```
   ```
   $ fastboot flash vendor /srv/user/android/open-q-820/out/target/product/msm8996/vendor.img
   Sending 'vendor' (406652 KB)                       OKAY [ 11.753s]
   Writing 'vendor'                                   OKAY [  3.903s]
   Finished. Total time: 15.701s
   ```
   ```
   $ fastboot flash recovery /srv/user/android/open-q-820/out/target/product/msm8996/recovery.img
   Sending 'recovery' (63009 KB)                      OKAY [  1.830s]
   Writing 'recovery'                                 OKAY [  0.624s]
   Finished. Total time: 2.503s
   ```

* Complete flashing and boot (could require secondary reboot):
   ```
   $ fastboot continue
   ```
