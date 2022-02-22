# EDL (QDL, QPST, QFIL) mode on Open-Q 820 Devboard

Emergency Download Mode is needed to recover your Qualcomm SoC in case your bootloader was broken.
This helped me to recovery from the incorrect `rpm` image flashing, so hopefully will help you too.

There is a number of ways to get into EDL mode, but here we will use the simplest one by USB cable.

## Requirements

* EDL cable (DIY)

## How to make EDL USB cable

To make it work - make sure you using the whole cable, not just the microusb head. The cable still
will serve you as regular USB cable, but with option to short the `Data+` line to ground.

There is multiple tutorials in the internet, so just the basic steps here:

1. Make sure the cable is actual USB-A to Micro-USB data cable, not just power one
2. Open the cable protection with knife along it's length
3. Find green and black wire and expose their copper wires
4. Solder a little button on the exposed wires - pressing will short GND and D+ lines
5. Use some glue or plastic to fixate the button on the cable

## Entering EDL mode for Open-Q 820 Devboard

1. Connect EDL cable to your host
2. Disable modem manager on your linux host: `sudo systemctl stop ModemManager`
3. Disconnect everything from the devboard
4. Find `S1` on the back side of the board and switch `USB Mode Select` to `ON` - this will enable
USB1 RECOVERY port and disable USB3 HOST ports on the devboard.
5. Put power cord in the dev board
6. Connect Debug UART USB and run minicom to monitor the boot process
7. Holding the button on the cable (GND and D+ shorted) connect microusb to the `USB1 RECOVERY` on
the devboard
8. When the devboard booted release the button on the cable and you will see that the host
recognized the new USB device with `idVendor=05c6` and `idProduct=9008` - it's your EDL

## Getting the EDL app

To use EDL we need a special application to interact with sahara protocol to upload the firehose
binary and make it do what we want. For that we will use edl from https://github.com/bkerler/edl

Just clone the repository: `git clone https://github.com/bkerler/edl` and follow the installation
procedures in the README file.

## Using EDL

The most important options is the `loader` and `skipresponse`:
* Loader is the firehose binary which is loaded to the memory to provide you interface to
interact with the resources on the board. We will take the built-in loader for our msm8996 platform.
* Skipresponse is needed, because for some reason the firehose doesn't response properly - so put
this option to make it work, otherwise edl will hang or drop into you some weird errors.

Not all the loaders will work well for you, for example to properly read the info I used
`qualcomm/model_generic/msm8996/0000000000000000_b53fb23d1953decb_fhprg_peek.bin`, but I found it's
incapable to write data (it takes a long time and when you read after write it's not changed). So
for write I had to switch to another firehose `Loaders/xiaomi/009470e100000000_355d47f912fea0af_fhprg_peek.bin`
and to make it work a bit alter the logic of edl to skip the weird bug during configure operation:
https://github.com/bkerler/edl/issues/238

### Getting info from the board

There is a couple of commands to get the useful information from the board, regarding storage and
overall system. Just execute something like:
```
$ edl printgpt --lun 4 --memory UFS --skipresponse --loader Loaders/qualcomm/model_generic/msm8996/0000000000000000_b53fb23d1953decb_fhprg_peek.bin
Qualcomm Sahara / Firehose Client V3.60 (c) B.Kerler 2018-2022.
main - Using loader Loaders/qualcomm/model_generic/msm8996/0000000000000000_b53fb23d1953decb_fhprg_peek.bin ...
main - Waiting for the device
main - Device detected :)
main - Mode detected: firehose
main - Trying to connect to firehose loader ...
firehose - fh.attrs.Verbose is set to 0
firehose - Chip serial num: 727671321 (0x2b5f6219)
firehose - Supported Functions: program configure nop firmwarewrite patch setbootablestoragedrive ufs emmc readIMEI writeIMEI simlock power benchmark read eMMCinfo getstorageinfo getsha256digest e
rase peek poke
firehose - TargetName=MSM8996
firehose - MemoryName=UFS
firehose - Version=2
firehose - Trying to read first storage sector...
firehose - Running configure...
firehose - {'Device Total Logical Blocks': '0x60ac00', 'Device Block Size in Bytes': '0x1000', 'Device Total Physical Paritions': '0x6', 'Device Manufacturer ID': '0x198', 'Device Serial Number':
'0x0', 'UFS fInitialized': '0x1', 'UFS Current LUN Number: ': ' 0xd0', 'UFS Total Active LU': '0x6', 'UFS wManufacturerID': '0x198', 'UFS Boot Partition Enabled': '0x1', 'UFS Raw Device Capacity:
': ' 0x3b9e000', 'UFS Min Block Size': '0x8', 'UFS Erase Block Size': '0x2000', 'UFS Allocation Unit Size': '0x1', 'UFS RPMB ReadWrite Size: ': ' 0x40', 'UFS Number of Allocation Uint for This LU'
: '0x0', 'UFS Logical Block Size': '0x0', 'UFS Provisioning Type': '0x0', 'UFS LU Write Protect': '0x0', 'UFS Boot LUN ID: ': ' 0x0', 'UFS Memory Type': '0x0', 'UFS LU Total Blocks': '0x0', 'UFS S
upported Memory Types': '0x801f', 'UFS dEnhanced1MaxNAllocU': '0x1dcf', 'UFS wEnhanced1CapAdjFac': '0x200', 'UFS dEnhanced2MaxNAllocU: ': ' 0x20', 'UFS wEnhanced2CapAdjFac': '0x200', 'UFS dEnhance
d3MaxNAllocU': '0x0', 'UFS wEnhanced3CapAdjFac': '0x0', 'UFS dEnhanced4MaxNAllocU': '0x0', 'UFS wEnhanced4CapAdjFac': '0x0', 'UFS LUN Enable Bitmask': '0x3f', 'UFS Logical Block Count': '0x0', 'UF
S bConfigDescrLock': '0x0', 'UFS iManufacturerName String Index': '0x1', 'UFS iProductName String Index': '0x2', 'UFS iSerialNumber String Index': '0x3', 'UFS iOemID String Index': '0x4', 'UFS Inq
uiry Command Output': 'TOSHIBA THGAF4G8N2LBAIRB0100 '}
firehose - {'Device Total Logical Blocks': '0x60ac00', 'Device Block Size in Bytes': '0x1000', 'Device Total Physical Paritions': '0x6', 'Device Manufacturer ID': '0x198', 'Device Serial Number':
'0x0', 'UFS fInitialized': '0x1', 'UFS Current LUN Number: ': ' 0xd0', 'UFS Total Active LU': '0x6', 'UFS wManufacturerID': '0x198', 'UFS Boot Partition Enabled': '0x1', 'UFS Raw Device Capacity:
': ' 0x3b9e000', 'UFS Min Block Size': '0x8', 'UFS Erase Block Size': '0x2000', 'UFS Allocation Unit Size': '0x1', 'UFS RPMB ReadWrite Size: ': ' 0x40', 'UFS Number of Allocation Uint for This LU'
: '0x0', 'UFS Logical Block Size': '0x0', 'UFS Provisioning Type': '0x0', 'UFS LU Write Protect': '0x0', 'UFS Boot LUN ID: ': ' 0x0', 'UFS Memory Type': '0x0', 'UFS LU Total Blocks': '0x0', 'UFS S
upported Memory Types': '0x801f', 'UFS dEnhanced1MaxNAllocU': '0x1dcf', 'UFS wEnhanced1CapAdjFac': '0x200', 'UFS dEnhanced2MaxNAllocU: ': ' 0x20', 'UFS wEnhanced2CapAdjFac': '0x200', 'UFS dEnhance
d3MaxNAllocU': '0x0', 'UFS wEnhanced3CapAdjFac': '0x0', 'UFS dEnhanced4MaxNAllocU': '0x0', 'UFS wEnhanced4CapAdjFac': '0x0', 'UFS LUN Enable Bitmask': '0x3f', 'UFS Logical Block Count': '0x0', 'UF
S bConfigDescrLock': '0x0', 'UFS iManufacturerName String Index': '0x1', 'UFS iProductName String Index': '0x2', 'UFS iSerialNumber String Index': '0x3', 'UFS iOemID String Index': '0x4', 'UFS Inq
uiry Command Output': 'TOSHIBA THGAF4G8N2LBAIRB0100 '}
firehose - 0x1
firehose_client - Supported functions:
-----------------
program,configure,nop,firmwarewrite,patch,setbootablestoragedrive,ufs,emmc,readIMEI,writeIMEI,simlock,power,benchmark,read,eMMCinfo,getstorageinfo,getsha256digest,erase,peek,poke

Parsing Lun 4:

GPT Table:
-------------
rpm:                 Offset 0x0000000000006000, Length 0x0000000000080000, Flags 0x1000000000000000, UUID a16bac30-1326-f6ca-8e7c-2faaca32da99, Type 0x98df793, Active False
rpmbak:              Offset 0x0000000000086000, Length 0x0000000000080000, Flags 0x1000000000000000, UUID d8829e88-9b2a-d439-1eac-6609dcf0b2c1, Type 0x98df793, Active False
tz:                  Offset 0x0000000000106000, Length 0x0000000000200000, Flags 0x1000000000000000, UUID 61f7bf05-ab56-e6bc-bb8b-46f59e1ecebc, Type 0xa053aa7f, Active False
tzbak:               Offset 0x0000000000306000, Length 0x0000000000200000, Flags 0x1000000000000000, UUID 8d301041-498d-3b85-1329-80b3cc3d0703, Type 0xa053aa7f, Active False
hyp:                 Offset 0x0000000000506000, Length 0x0000000000080000, Flags 0x1000000000000000, UUID bc3c61eb-95cc-4035-dd09-f92756537f46, Type 0xe1a6a689, Active False
hypbak:              Offset 0x0000000000586000, Length 0x0000000000080000, Flags 0x1000000000000000, UUID 5830e1b7-b7ad-0bb4-99f6-d803216013a0, Type 0xe1a6a689, Active False
fsg:                 Offset 0x0000000000606000, Length 0x0000000000200000, Flags 0x1000000000000000, UUID 8cbe317e-dbb3-db04-b7cf-516a5b2ee92a, Type 0x638ff8e2, Active False
sec:                 Offset 0x0000000000806000, Length 0x0000000000004000, Flags 0x1000000000000000, UUID 1548cb91-5b77-48f7-08e7-20e7c6bcadbb, Type 0x303e6ac3, Active False
pmic:                Offset 0x000000000080a000, Length 0x0000000000080000, Flags 0x1000000000000000, UUID 53e1ea64-dab9-3542-b7b4-1b935aabb203, Type 0xc00eef24, Active False
pmicbak:             Offset 0x000000000088a000, Length 0x0000000000080000, Flags 0x1000000000000000, UUID 8927eacf-79ac-a277-afcd-c5207699b2ec, Type 0xc00eef24, Active False
modem:               Offset 0x000000000090a000, Length 0x0000000005f00000, Flags 0x1000000000000000, UUID 6068c262-35f4-e794-86e3-008b74f19a38, Type EFI_BASIC_DATA, Active False
dsp:                 Offset 0x000000000680a000, Length 0x0000000001000000, Flags 0x1000000000000000, UUID 83ca8a0d-6e04-626f-69f9-cffd8fa2f59e, Type 0x7efe5010, Active False
dip:                 Offset 0x000000000780a000, Length 0x0000000000100000, Flags 0x1000000000000000, UUID e9565799-03db-8a15-5f18-d294b672a990, Type 0x4114b077, Active False
mdtp:                Offset 0x000000000790a000, Length 0x0000000002000000, Flags 0x1000000000000000, UUID c1093cf0-8517-627a-0ba9-3a244fa56a0c, Type 0x3878408a, Active False
aboot:               Offset 0x000000000990a000, Length 0x0000000000100000, Flags 0x1000000000000000, UUID dcd49fc3-dea6-6d20-30a9-069b65d0935d, Type 0x400ffdcd, Active False
abootbak:            Offset 0x0000000009a0a000, Length 0x0000000000100000, Flags 0x1000000000000000, UUID f1491067-00d8-31a0-79c5-d8305c14536b, Type 0x400ffdcd, Active False
boot:                Offset 0x0000000009b0a000, Length 0x0000000004000000, Flags 0x1000000000000000, UUID 0be2bf76-7058-ae79-9edc-e304f3a51bdb, Type 0x20117f86, Active False
system:              Offset 0x000000000db0a000, Length 0x00000000c0000000, Flags 0x1000000000000000, UUID 1533f726-c278-52fe-fa75-9e5dbcc1de5b, Type 0x97d7b011, Active False
recovery:            Offset 0x00000000cdb0a000, Length 0x0000000004000000, Flags 0x1000000000000000, UUID 0cb57bbe-e391-c70f-4ec2-82e5c0c8f41d, Type 0x9d72d4e4, Active False
devinfo:             Offset 0x00000000d1b0a000, Length 0x0000000000001000, Flags 0x1000000000000000, UUID d2457b35-aff9-7485-2b15-af48ae9cc5f6, Type 0x65addcf4, Active False
bluetooth:           Offset 0x00000000d1b0b000, Length 0x0000000000100000, Flags 0x1000000000000000, UUID 57148a79-9018-2330-3796-19ace13d7c5a, Type 0x6cb747f1, Active False
keymaster:           Offset 0x00000000d1c0b000, Length 0x0000000000080000, Flags 0x1000000000000000, UUID 4fcd6677-e89a-ec9d-b7a9-627110c320e6, Type 0x4f772165, Active False
keymasterbak:        Offset 0x00000000d1c8b000, Length 0x0000000000080000, Flags 0x1000000000000000, UUID ca67fe2b-5baa-7d25-1ce1-e8814a1dae09, Type 0x4f772165, Active False
cmnlib:              Offset 0x00000000d1d0b000, Length 0x0000000000080000, Flags 0x1000000000000000, UUID 087a42b0-6f63-5ddd-b9ca-8ae0e81804c9, Type 0x73471795, Active False
cmnlibbak:           Offset 0x00000000d1d8b000, Length 0x0000000000080000, Flags 0x1000000000000000, UUID 29583d61-fffe-bfc5-0b74-81e97a36a8fc, Type 0x73471795, Active False
cmnlib64:            Offset 0x00000000d1e0b000, Length 0x0000000000080000, Flags 0x1000000000000000, UUID 251fda90-4a4d-98ae-cff8-af6cd4da0413, Type 0x8ea64893, Active False
cmnlib64bak:         Offset 0x00000000d1e8b000, Length 0x0000000000080000, Flags 0x1000000000000000, UUID f3ef7361-108e-d461-2267-d1ab9dc20a9c, Type 0x8ea64893, Active False
apdp:                Offset 0x00000000d1f0b000, Length 0x0000000000040000, Flags 0x1000000000000000, UUID e25118df-f580-35d6-3f5c-0e2e72498847, Type 0xe6e98da2, Active False
msadp:               Offset 0x00000000d1f4b000, Length 0x0000000000040000, Flags 0x1000000000000000, UUID db3f36c3-18cc-f14c-3a81-0ff9ea5d2535, Type 0xed9e8101, Active False
dpo:                 Offset 0x00000000d1f8b000, Length 0x0000000000001000, Flags 0x1000000000000000, UUID 36ca4436-1a62-e040-fefc-1e1b3a02c3ef, Type 0x11406f35, Active False
splash:              Offset 0x00000000d1f8c000, Length 0x00000000020a4000, Flags 0x1000000000000000, UUID bf92587b-66e1-a141-5c5b-051b03daa7ec, Type 0xad99f201, Active False
sti:                 Offset 0x00000000d4030000, Length 0x0000000000200000, Flags 0x0000000000000000, UUID ab89e120-3cfc-3914-e9ca-2449fe786f6a, Type 0xaa9a5c4c, Active False

Total disk size:0x000000010001c000, sectors:0x000000000010001c
```

### Dump the entire storage

```
$ edl rf storage.img --memory UFS --skipresponse --loader Loaders/qualcomm/model_generic/msm8996/0000000000000000_b53fb23d1953decb_fhprg_peek.bin
...
firehose_client - Supported functions:
-----------------
program,configure,nop,firmwarewrite,patch,setbootablestoragedrive,ufs,emmc,readIMEI,writeIMEI,simlock,power,benchmark,read,eMMCinfo,getstorageinfo,getsha256digest,erase,peek,poke
Dumping lun 0 with sector count 6335516 as out.flash.
firehose -
Reading from physical partition 0, sector 0, sectors 6335516
Progress: |█████████-----------------------------------------|  18.0% Read (Sector 0x115D00 of 0x60AC1C, 57m:54s left) 5.83 MB/s
```

### Flash partition

In case you just need to write one partition (to restore it or change a bit) - you can use the next
command (writing `rpmbak.img` file to the `rpm` partition):

(NOTE: if you see the partition is now wrtiting quickly - means you have a wrong firehose or
the write auth is required. First of all check `getstorageinfo` command "UFS LU Write Protect" flag
and try the other firehoses for your SoC before panic.)

```
$ edl w rpm rpmbak.img  --memory UFS --loader Loaders/xiaomi/009470e100000000_355d47f912fea0af_fhprg_peek.bin
Qualcomm Sahara / Firehose Client V3.60 (c) B.Kerler 2018-2022.
main - Using loader Loaders/xiaomi/009470e100000000_355d47f912fea0af_fhprg_peek.bin ...
main - Waiting for the device
main - Device detected :)
sahara - Protocol version: 2.1
main - Mode detected: sahara
sahara -
------------------------
HWID:              0x0003e0e100000000 (MSM_ID:0x0003e0e1,OEM_ID:0x0000,MODEL_ID:0x0000)
Unknown CPU, please send log as issue to https://github.com/bkerler/edl
PK_HASH:           0x7be49b72f9e4337223ccb84d6eccca4e61ce16e3602ac2008cb18b75babe6d09
Serial:            0x2b5f6219

sahara - Protocol version: 2.1
sahara - Uploading loader Loaders/xiaomi/009470e100000000_355d47f912fea0af_fhprg_peek.bin ...
sahara - 64-Bit mode detected.
sahara - Firehose mode detected, uploading...
sahara - Loader successfully uploaded.
main - Trying to connect to firehose loader ...
firehose
firehose - [LIB]: !DEBUG! rsp.data: 'bytearray(b'<?xml version="1.0" encoding="UTF-8" ?>\n<data>\n<log value="Binary build date: Feb 27 2016 @ 21:09:42"/>\n</data><?xml version="1.0" encoding="UTF-8" ?>\n<data>\n<log value="Chip serial num: 727671321 (0x2b5f6219)"/>\n</data><?xml version="1.0" encoding="UTF-8" ?>\n<data>\n<log value="Supported Functions: program configure nop firmwarewrite patch setbootablestoragedrive ufs emmc power benchmark read getstorageinfo getsha256digest erase peek poke "/>\n</data><?xml version="1.0" encoding="UTF-8" ?>\n<data>\n<log value="ufs 198,3b9e000"/>\n</data>')'
firehose - TargetName=MSM8996
firehose - MemoryName=UFS
firehose - Version=1
firehose - Trying to read first storage sector...
firehose - Running configure...
firehose - {'Device Total Logical Blocks': '0x60ac00', 'Device Block Size in Bytes': '0x1000', 'Device Total Physical Paritions': '0x6', 'Device Manufacturer ID': '0x198', 'Device Serial Number': '0x0', 'UFS fInitialized': '0x1', 'UFS Current LUN Number: ': ' 0xd0', 'UFS Total Active LU': '0x6', 'UFS wManufacturerID': '0x198', 'UFS Boot Partition Enabled': '0x1', 'UFS Raw Device Capacity: ': ' 0x3b9e000', 'UFS Min Block Size': '0x8', 'UFS Erase Block Size': '0x2000', 'UFS Allocation Unit Size': '0x1', 'UFS RPMB ReadWrite Size: ': ' 0x40', 'UFS Number of Allocation Uint for This LU': '0x0', 'UFS Logical Block Size': '0x0', 'UFS Provisioning Type': '0x0', 'UFS LU Write Protect': '0x0', 'UFS Boot LUN ID: ': ' 0x0', 'UFS Memory Type': '0x0', 'UFS LU Total Blocks': '0x0', 'UFS Supported Memory Types': '0x801f', 'UFS dEnhanced1MaxNAllocU': '0x1dcf', 'UFS wEnhanced1CapAdjFac': '0x200', 'UFS dEnhanced2MaxNAllocU: ': ' 0x20', 'UFS wEnhanced2CapAdjFac': '0x200', 'UFS dEnhanced3MaxNAllocU': '0x0', 'UFS wEnhanced3CapAdjFac': '0x0', 'UFS dEnhanced4MaxNAllocU': '0x0', 'UFS wEnhanced4CapAdjFac': '0x0', 'UFS LUN Enable Bitmask': '0x3f', 'UFS Logical Block Count': '0x0', 'UFS bConfigDescrLock': '0x0', 'UFS iManufacturerName String Index': '0x1', 'UFS iProductName String Index': '0x2', 'UFS iSerialNumber String Index': '0x3', 'UFS iOemID String Index': '0x4', 'UFS Inquiry Command Output': 'TOSHIBA THGAF4G8N2LBAIRB0100 '}
firehose - {'Device Total Logical Blocks': '0x60ac00', 'Device Block Size in Bytes': '0x1000', 'Device Total Physical Paritions': '0x6', 'Device Manufacturer ID': '0x198', 'Device Serial Number': '0x0', 'UFS fInitialized': '0x1', 'UFS Current LUN Number: ': ' 0xd0', 'UFS Total Active LU': '0x6', 'UFS wManufacturerID': '0x198', 'UFS Boot Partition Enabled': '0x1', 'UFS Raw Device Capacity: ': ' 0x3b9e000', 'UFS Min Block Size': '0x8', 'UFS Erase Block Size': '0x2000', 'UFS Allocation Unit Size': '0x1', 'UFS RPMB ReadWrite Size: ': ' 0x40', 'UFS Number of Allocation Uint for This LU': '0x0', 'UFS Logical Block Size': '0x0', 'UFS Provisioning Type': '0x0', 'UFS LU Write Protect': '0x0', 'UFS Boot LUN ID: ': ' 0x0', 'UFS Memory Type': '0x0', 'UFS LU Total Blocks': '0x0', 'UFS Supported Memory Types': '0x801f', 'UFS dEnhanced1MaxNAllocU': '0x1dcf', 'UFS wEnhanced1CapAdjFac': '0x200', 'UFS dEnhanced2MaxNAllocU: ': ' 0x20', 'UFS wEnhanced2CapAdjFac': '0x200', 'UFS dEnhanced3MaxNAllocU': '0x0', 'UFS wEnhanced3CapAdjFac': '0x0', 'UFS dEnhanced4MaxNAllocU': '0x0', 'UFS wEnhanced4CapAdjFac': '0x0', 'UFS LUN Enable Bitmask': '0x3f', 'UFS Logical Block Count': '0x0', 'UFS bConfigDescrLock': '0x0', 'UFS iManufacturerName String Index': '0x1', 'UFS iProductName String Index': '0x2', 'UFS iSerialNumber String Index': '0x3', 'UFS iOemID String Index': '0x4', 'UFS Inquiry Command Output': 'TOSHIBA THGAF4G8N2LBAIRB0100 '}
firehose - 0x1
firehose_client - Supported functions:
-----------------
firehose -
Writing to physical partition 4, sector 6, sectors 128
Progress: |██████████████████████████████████████████████████| 100.0% Write (Sector 0x80 of 0x80, ) 7.04 MB/s
Wrote rpmbak.img to sector 6.
```

## Useful docs

* https://web.archive.org/web/20220107093520/https://alephsecurity.com/2018/01/22/qualcomm-edl-1/
* https://www.96boards.org/documentation/consumer/dragonboard/dragonboard820c/installation/board-recovery.md.html
* https://www.96boards.org/documentation/consumer/guides/qdl.md.html
* JTAG pinout: https://www.manualslib.com/manual/1299111/Intrinsyc-Open-Q-835.html?page=26
* https://forum.xda-developers.com/t/guide-how-to-dump-and-write-back-the-storage-on-most-of-qualcomm-devices.3949588/
