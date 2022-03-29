# Prototype 1

The first prototype with the custom PCB design to fuse the SOM and modules together. Basically it
contains a number of buttons, leds, dual USB-C interface and a way to put SOM in place and connect
the displays.

## Requirements

1. Open Source and Open Hardware platform for light-weight wearable stereo displays as close as
currently possible to the regular glasses
2. No AR-grade positioning detection - just good quality high resolution see-through displays
(1920x1080)
3. Wireless (WiFi ac, h264/h265, battery power) and direct drive (USB-C DP alt-mode)

## Components

* [Platform](../../platform/snapdragon_820/open-q-u820/) - Open-Q µSOM 820
   * SOC - Snapdragon 820
* [Modules](../../modules/enmesi/r6) - Enmesi R6
  Birdbath (the best weight/quality ratio for now)
   * Displays - Sony ECX335S
* [PCB](pcb) - where SOM & Modules are met
* [Frame](frame) - TODO

## Documents

* [Design Document](Design Document.pdf)

## Configuring

In order to make Open-Q µSOM 820 work on the prototype - it should have a specific rpm partition
with modified LDO voltages. For this purpose it's better to get the original rpm partition from the
board, alter it's binary structure to write the required values into the special structure, resign
it and write back to the board.

To do that it's needed to have the original devboard for the prototype test board. Prototype release
will support protection for the used rails and will allow to flash any µSOM to the needed state.

**WARNING**: this is dangerous - writing the low-level partitions and especially altering them could
make your µSOM and devboard not bootable with common methods (only by EDL recovery), and the
operation we're going to do will make the µSOM not to work with devboard until the partition will
be restored. So you know - as is.

### Get with ADB

You can receive the rpm partition with root ADB.

1. Connect your devboard to power source
2. Connect the `USB2.0 (ADB)` to you host computer
3. Boot the devboard to android by pressing `ON/OFF` button
4. When the board boot-up switch the adbd to root mode and get the rpm partition this way:
   ```
   host $ adb root
   restarting adbd as root

   host $ adb shell cat /dev/block/by-name/rpm > rpm.img
   ```
5. And now you have the rpm partition image

### Modify the RPM partition

The voltages in the original RPM configuration is not suitable, so we need to reconfigure them.

1. Modify the `rpm.img` with [rpm_ldo_rail_tool.py](../../platform/snapdragon_820/tools/rpm_ldo_rail_tool.py):
   ```
   host $ platform/snapdragon_820/tools/rpm_ldo_rail_tool.py rpm.img
   Search for magic 00000000000000000a9001: 0x1000 0x2000 0x3000 0x4000 0x5000 0x6000 0x7000 0x8000 0x9000 0xa000 0xb000 0xc000 0xd000 0xe000 0xf000 0x10000 0x11000 0x12000 0x13000 0x14000 0x15000 0x16000 0x17000 0x18000 0x19000 0x1a000 0x1b000 0x1c000 0x1d000 0x1e000 0x1f000 0x20000 0x21000 0x22000 0x23000 0x24000 0x25000 0x26000 0x27000 0x28000 0x29000 0x2a000 0x2b000 0x2c000 0x2d000 0x2e000 0x2f000 0x30000 0x31000 0x32000 0x33000
   LDO struct was found on address 0x33098 processing...

   LDO14 raw: 0ac01202a406ea0b00000300
      Current Threshold: 10mA, Safety Headroom: 300mV
      Voltage Min: 1.700V
      Voltage Max: 3.050V
   LDO15 raw: 0ac012020807080700000300
      Current Threshold: 10mA, Safety Headroom: 300mV
    ! Voltage Min: 1.800V -> 1.200V
    ! Voltage Max: 1.800V -> 1.500V
   LDO17 raw: 0aa00f02c4098c0a00000300
      Current Threshold: 10mA, Safety Headroom: 250mV
    ! Voltage Min: 2.500V -> 1.750V
    ! Voltage Max: 2.700V -> 3.300V
   LDO18 raw: 0a800c028c0a540b00000200
      Current Threshold: 10mA, Safety Headroom: 200mV
    ! Voltage Min: 2.700V -> 1.800V
      Voltage Max: 2.900V
   LDO19 raw: 0a400602220b1c0c00000300
      Current Threshold: 10mA, Safety Headroom: 100mV
    ! Voltage Min: 2.850V -> 1.200V
    ! Voltage Max: 3.100V -> 1.500V
   LDO21 raw: 0ac012028c0a860b00000200
      Current Threshold: 10mA, Safety Headroom: 300mV
    ! Voltage Min: 2.700V -> 1.750V
    ! Voltage Max: 2.950V -> 3.300V
   LDO22 raw: 0ac01202d606e40c00000300
      Current Threshold: 10mA, Safety Headroom: 300mV
      Voltage Min: 1.750V
      Voltage Max: 3.300V
   LDO23 raw: 0a800c028c0a540b00000300
      Current Threshold: 10mA, Safety Headroom: 200mV
    ! Voltage Min: 2.700V -> 1.800V
      Voltage Max: 2.900V
   LDO29 raw: 05900102be0a220b00000300
      Current Threshold: 5mA, Safety Headroom: 25mV
    ! Voltage Min: 2.750V -> 1.750V
    ! Voltage Max: 2.850V -> 3.300V

   Result of modified rpm: rpm_mod.img
   Search complete
   ```
2. When you've get your `rpm_mod.img` - you need to sign it by [qtestsign](https://github.com/msm8916-mainline/qtestsign)
   ```
   host $ git clone https://github.com/msm8916-mainline/qtestsign
   Cloning into 'qtestsign'...
   remote: Enumerating objects: 17, done.
   remote: Counting objects: 100% (17/17), done.
   remote: Compressing objects: 100% (11/11), done.
   remote: Total 17 (delta 3), reused 17 (delta 3), pack-reused 0
   Unpacking objects: 100% (17/17), 16.64 KiB | 97.00 KiB/s, done.

   host $ cd qtestsign

   host $ python3 -m venv .venv

   host $ . .venv/bin/activate

   host $ pip install -r requirements.txt
   Collecting cryptography>=3.1
     Downloading cryptography-36.0.1-cp36-abi3-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (3.8 MB
   )
        |████████████████████████████████| 3.8 MB 321 kB/s
   Collecting cffi>=1.12
     Downloading cffi-1.15.0-cp38-cp38-manylinux_2_12_x86_64.manylinux2010_x86_64.whl (446 kB)
        |████████████████████████████████| 446 kB 41.9 MB/s
   Collecting pycparser
     Downloading pycparser-2.21-py2.py3-none-any.whl (118 kB)
        |████████████████████████████████| 118 kB 35.8 MB/s
   Installing collected packages: pycparser, cffi, cryptography
   Successfully installed cffi-1.15.0 cryptography-36.0.1 pycparser-2.21

   host $ ./qtestsign.py rpm rpm_mod.img
   Before: Elf(ehdr=Ehdr(ei_magic=b'\x7fELF', ei_class=1, ei_data=1, ei_version=1, ei_os_abi=0, ei_abi_version=0, e_type=2, e_machine=40, e_version=1, e_entry=9, e_phoff=52, e_shoff=0, e_flags=83886082, e_ehsize=52, e_phentsize=32, e_phnum=4, e_shentsize=40, e_shnum=0, e_shstrndx=0), phdrs=[Phdr(p_type=0, p_offset=0, p_vaddr=0, p_paddr=0, p_filesz=180, p_memsz=0, p_flags=117440512, p_align=0), Phdr(p_type=0, p_offset=4096, p_vaddr=2752512, p_paddr=2752512, p_filesz=6568, p_memsz=8192, p_flags=35651584, p_align=4096), Phdr(p_type=1, p_offset=12288, p_vaddr=0, p_paddr=2097152, p_filesz=163472, p_memsz=163472, p_flags=2147483655, p_align=4), Phdr(p_type=1, p_offset=175760, p_vaddr=589824, p_paddr=2686976, p_filesz=53692, p_memsz=61884, p_flags=7, p_align=32)])
   Header(version=0, type=3, flash_addr=0, dest_addr=2752552, total_size=2432, hash_size=128, signature_addr=2752680, signature_size=256, cert_chain_addr=2752936, cert_chain_size=2048)
   After: Elf(ehdr=Ehdr(ei_magic=b'\x7fELF', ei_class=1, ei_data=1, ei_version=1, ei_os_abi=0, ei_abi_version=0, e_type=2, e_machine=40, e_version=1, e_entry=9, e_phoff=52, e_shoff=0, e_flags=83886082, e_ehsize=52, e_phentsize=32, e_phnum=4, e_shentsize=40, e_shnum=0, e_shstrndx=0), phdrs=[Phdr(p_type=0, p_offset=0, p_vaddr=0, p_paddr=0, p_filesz=180, p_memsz=0, p_flags=117440512, p_align=0),Phdr(p_type=0, p_offset=4096, p_vaddr=2752512, p_paddr=2752512, p_filesz=2472, p_memsz=4096, p_flags=35651584, p_align=4096), Phdr(p_type=1, p_offset=6568, p_vaddr=0, p_paddr=2097152, p_filesz=163472, p_memsz=163472, p_flags=2147483655, p_align=4), Phdr(p_type=1, p_offset=170048, p_vaddr=589824, p_paddr=2686976, p_filesz=53692, p_memsz=61884, p_flags=7, p_align=32)])
   ```
8. And now you have the modified and signed RPM for the binocular prototype - just need to flash it...

### Write with fastboot mode

Unfortunately fastboot doesn't provide a way to read the partition (fetch operation is not working),
but can help to write it back to the flash. After that you will need to dicsonnect your µSOM and
move it to the prototype board.

**WARNING:** after this operation you will not be able to boot the µSOM on Open-Q devboard until
you will restore the RPM partition to the original one. So make sure you have a backup of the
original rpm.img. The voltage changes should not fry your devboard, but better to not leave it on
the powered Open-Q devboard for a long time (precaution).

1. Disconnect the sensors expansion board (precaution)
2. Connect your devboard to power source
3. Connect the `USB2.0 (ADB)` to you host computer
4. Boot the devboard to fastboot mode by pressing `VOL (-)` and `ON/OFF` buttons together
5. Check the fastboot device connected properly:
   ```
   host $ fastboot devices
   277010101071910397      fastboot
   ```
6. Flash the modified RPM to the board
   ```
   host $ fastboot flash rpm rpm_mod-test-signed.mbn
   Sending 'rpm' (218 KB)                             OKAY [  0.037s]
   Writing 'rpm'                                      OKAY [  0.026s]
   Finished. Total time: 0.115s
   ```

### Using EDL mode

EDL mode is advanced recovery mode for Qualcomm SoC and needs some additional knowledge, but if you
want to dig in (or have no choice because your bootloader is not working well anymore) - welcome to
the special page about it: [EDL Mode](../../platform/snapdragon_820/open-q-u820/edl_mode.md)
