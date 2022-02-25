#!/usr/bin/env python3
#
# This tool script is needed to modify the rpm.mbn (or rpm.img) without recompiling through amss
# toolkit, which is not freely available for the community. The logic behind this script just
# allows to change the voltages in the ldo_rail_a structure which is a configuration of the
# boot-time pmic outputs. Tested on MSM8996 nSoM from (Lantronix) Intrinsyc and aimed to pm8996.
#
# Usage: ./rpm_ldo_rail_tool.py <path_to_rpm>
#
# During execution it will try to find the magic in the binary and if it's found - will show the
# current status of parameters, changes and will generate a new rpm_mod.mbn in the same directory.
#

import os, sys
import shutil
import struct
import tempfile

# LDO_n => (min_mV, max_mV)
todo_ldo_mv = {
    14: (1700, 3050), # 2.8V, J302, 36 pin,    VREG_L14A_2P8  (def 1.8V)  -> touch controll module (devboard: Display conn ???)
    15: (1200, 1800), # 1.2V, J302, 6 pin,     VREG_L15A_1P2  (def 1.8V)  -> LCD controllor TC358775XBG (devboard: Display conn ???)
    17: (2500, 3300), # 3.3V, J302, 17 pin,    VREG_L17A_3P3  (def 2.8V)  -> LT7911D power supply (devboard: CAM0 conn (pin 5), J60 POWER CONN (pin 2))
    18: (1800, 2900), # 1.8V, J501, 100 pin,   VREG_L18A_1P8  (def 2.85V) -> right LCD (devboard: CAM1 conn (pin 5), J60 POWER CONN (pin 8))
    19: (1200, 3100), # 1.2V, J302, 2+4 pin,   VREG_L19A_1P2  (def 2.8V)  -> LT7911D power supply (devboard: J53 Sensor Expansion Header (pin 8))
    21: (2700, 3300), # 3.3V, J302, 19+21 pin, VREG_L21A_3P3  (def 2.95V) -> TUSB564 and TPS65988 (devboard: microsd card ???)
    22: (1750, 3300), # 2.85V, J301, 30 pin,   VREG_L22A_2P85 (def 3.0V)  -> BNO085 9-axis sensor (devboard: ???)
    23: (1800, 2900), # 1.8V, J302, 23 pin,    VREG_L23A_1P8  (def 2.8V)  -> left LCD (devboard: CAM0 conn (pin 7,8), J60 POWER CONN (pin 3,15))
    29: (2750, 3300), # 3.3V, J302, 51 pin,    VREG_L29A_3P3  (def 2.8V)  -> TUSB546 (devboard: J60 POWER CONN (pin 14))
}

ldo_num = 32 # Number of LDO config items to process
ldo1_current_threshold = 10 # in mA
ldo1_safety_headroom = 25 # in mV


rpm_file_path = sys.argv[1]

# Pack as 12 bit unsigned each
packed = struct.pack('<L', ldo1_current_threshold | ldo1_safety_headroom << 12)[0:3]
# Preparing the magic to find the ldo_rail_a struct - it starts with zero bytes and 3 bytes of
# 12 bit unsigned int with values of Current Threshold and Safety Headroom of LDO1
magic = b'\x00\x00\x00\x00\x00\x00\x00\x00' + packed

print("Search for magic", magic.hex(), end=": ")

with open(rpm_file_path, 'rb') as f:
    new_rpm = tempfile.NamedTemporaryFile('wb')
    size = len(magic)
    pos = 0
    while True:
        data = f.read(size)
        if not data:
            print("\nERROR: Can't find the magic - incorrect rpm.mbn or modified first values of ldo_rail_a struct?")
            sys.exit(1)

        if data == magic:
            new_rpm.write(data[0:-len(packed)])
            break

        new_rpm.write(bytes([data[0]]))

        pos += 1
        if pos % 0x1000 == 0:
            print(hex(pos), end=" ")
        f.seek(pos)

    print("\nLDO struct was found on address", hex(pos+8), "processing...\n")
    f.seek(pos+size-len(packed))

    changed = False

    for n in range(1, ldo_num+1):
        data = f.read(12) # line of ldo consists of 12 bytes: u12u12u1u1u1u3u1u1 u16u16 u16u1u1u14 
        newdata = list(data)
        print("LDO{} raw:".format(n), data.hex())

        # u12u12
        (word,) = struct.unpack('<L', data[0:3] + b'\x00')
        ldo_current_threshold = word & 0xfff
        ldo_safety_headroom = (word >> 12) & 0xfff
        print("   Current Threshold: %dmA, Safety Headroom: %dmV" % (
            ldo_current_threshold, ldo_safety_headroom))

        # u1u1u1u3u1u1
        # TODO

        # u16u16
        (ldo_min_mv,ldo_max_mv) = struct.unpack('<HH', data[4:8])
        if n in todo_ldo_mv.keys():
            print(" ! Voltage: Min: %.3fV -> %.3fV, Max: %.3fV -> %.3fV" % (
                ldo_min_mv/1000, todo_ldo_mv[n][0]/1000, ldo_max_mv/1000, todo_ldo_mv[n][1]/1000))
            newdata[4:8] = list(struct.pack('<HH', todo_ldo_mv[n][0], todo_ldo_mv[n][1]))
        else:
            print("   Voltage: Min: %.3fV, Max: %.3fV" % (
                ldo_min_mv/1000, ldo_max_mv/1000))

        # u16u1u1u14
        # TODO

        # Writing the changed data to new rpm
        newdata = bytes(newdata)
        if newdata != data:
            changed = True
        new_rpm.write(newdata)

    if not changed:
        print("\n No changes need to be done.")
        sys.exit(0)

    # Writing the rest of the file
    data = 'start'
    while data:
        data = f.read(4096)
        new_rpm.write(data)

    new_rpm.flush()
    new_path = '_mod'.join(os.path.splitext(rpm_file_path))
    shutil.copyfile(new_rpm.name, new_path)
    print("\nResult of modified rpm:", new_path)

print("Search complete")
