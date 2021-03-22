EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L ER8-100P-0.8SV-5H:ER8-100P-0.8SV-5H J1
U 1 1 5FBC7F12
P 1350 950
F 0 "J1" H 1850 1215 50  0000 C CNN
F 1 "ER8-100P-0.8SV-5H" H 1850 1124 50  0000 C CNN
F 2 "custom_footprints:ER8100P08SV5H" H 2200 1050 50  0001 L CNN
F 3 "https://www.hirose.com/product/en/download_file/key_name/ER8-100P-0.8SV-5H/category/Drawing%20(2D)/doc_file_id/142172/?file_category_id=6&item_id=06250030000&is_series=" H 2200 950 50  0001 L CNN
F 4 "Board to Board & Mezzanine Connectors HighSpeed Trans HDR 100P STRGHT 0.76um" H 2200 850 50  0001 L CNN "Description"
F 5 "8.905" H 2200 750 50  0001 L CNN "Height"
F 6 "Hirose" H 2200 650 50  0001 L CNN "Manufacturer_Name"
F 7 "ER8-100P-0.8SV-5H" H 2200 550 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "" H 2200 450 50  0001 L CNN "Arrow Part Number"
F 9 "" H 2200 350 50  0001 L CNN "Arrow Price/Stock"
F 10 "798-ER8-100P-08SV-5H" H 2200 250 50  0001 L CNN "Mouser Part Number"
F 11 "https://www.mouser.com/Search/Refine.aspx?Keyword=798-ER8-100P-08SV-5H" H 2200 150 50  0001 L CNN "Mouser Price/Stock"
	1    1350 950 
	1    0    0    -1  
$EndComp
$Comp
L FF0881SA1-R3000:FF0881SA1-R3000 J3
U 1 1 5FBCBCF3
P 5750 850
F 0 "J3" H 6200 1115 50  0000 C CNN
F 1 "FF0881SA1-R3000" H 6200 1024 50  0000 C CNN
F 2 "custom_footprints:FF0881SA1R3000" H 6500 950 50  0001 L CNN
F 3 "http://www.jae.com/z-en/pdf_download_exec.cfm?param=SJ108178.pdf" H 6500 850 50  0001 L CNN
F 4 "FFC & FPC Connectors 81P 0.2MM FPC" H 6500 750 50  0001 L CNN "Description"
F 5 "1" H 6500 650 50  0001 L CNN "Height"
F 6 "JAE Electronics" H 6500 550 50  0001 L CNN "Manufacturer_Name"
F 7 "FF0881SA1-R3000" H 6500 450 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "" H 6500 350 50  0001 L CNN "Arrow Part Number"
F 9 "" H 6500 250 50  0001 L CNN "Arrow Price/Stock"
F 10 "656-FF0881SA1-R3000" H 6500 150 50  0001 L CNN "Mouser Part Number"
F 11 "https://www.mouser.co.uk/ProductDetail/JAE-Electronics/FF0881SA1-R3000?qs=e3doH35UsB4mcpzu8vQ7Tw%3D%3D" H 6500 50  50  0001 L CNN "Mouser Price/Stock"
	1    5750 850 
	1    0    0    -1  
$EndComp
Text GLabel 5750 4750 0    50   Input ~ 0
VCATH
Text GLabel 6650 4850 2    50   Input ~ 0
VCATH
Text GLabel 6650 4750 2    50   Input ~ 0
VCCP_O
Text GLabel 5600 4650 0    50   Input ~ 0
VCCP_I
Text GLabel 6650 4650 2    50   Input ~ 0
VCCP_I
Text GLabel 6650 4550 2    50   Input ~ 0
VDD2-10V
Text GLabel 5750 4550 0    50   Input ~ 0
VDD2-10V
Text GLabel 6650 4450 2    50   Input ~ 0
VSS
Text GLabel 6650 4350 2    50   Input ~ 0
VSS
Text GLabel 5750 4350 0    50   Input ~ 0
VSS
Text GLabel 5750 4450 0    50   Input ~ 0
VSS
Text GLabel 6650 4250 2    50   Input ~ 0
VDD1-1.8V
Text GLabel 5750 4250 0    50   Input ~ 0
VDD1-1.8V
Text GLabel 5750 4150 0    50   Input ~ 0
XCS
Text GLabel 6650 4150 2    50   Input ~ 0
XSCK
Text GLabel 5750 4050 0    50   Input ~ 0
SI
Text GLabel 6650 4050 2    50   Output ~ 0
SO
Text GLabel 5750 3950 0    50   Input ~ 0
PSCNT
Text GLabel 6650 3950 2    50   Input ~ 0
XCLR
NoConn ~ 5750 3850
NoConn ~ 5750 3550
Text GLabel 6650 3850 2    50   Input ~ 0
TEST-GND
Text GLabel 6650 3550 2    50   Input ~ 0
VDD1IF
Text GLabel 5750 3450 0    50   Input ~ 0
VSSIF
Text GLabel 6650 3350 2    50   Input ~ 0
LV1A
Text GLabel 5750 3250 0    50   Input ~ 0
LV1B
Text GLabel 6650 3250 2    50   Input ~ 0
LV2A
Text GLabel 5750 2850 0    50   Input ~ 0
LV5B
Text GLabel 6650 3150 2    50   Input ~ 0
LV3A
Text GLabel 5750 2950 0    50   Input ~ 0
LV4B
Text GLabel 6650 3050 2    50   Input ~ 0
LV4A
Text GLabel 5750 3050 0    50   Input ~ 0
LV3B
Text GLabel 6650 2950 2    50   Input ~ 0
LV5A
Text GLabel 5750 3150 0    50   Input ~ 0
LV2B
Text GLabel 6650 3750 2    50   Input ~ 0
TEST-GND
Text GLabel 6650 3650 2    50   BiDi ~ 0
TEST-GND
Text GLabel 5750 3750 0    50   Input ~ 0
TEST-GND
Text GLabel 5750 3650 0    50   Input ~ 0
TEST-GND
Text GLabel 6650 3450 2    50   Input ~ 0
TEST-GND
Text GLabel 5750 3350 0    50   Input ~ 0
TEST-GND
Text GLabel 6650 2850 2    50   Input ~ 0
VDD1IF
Text GLabel 5750 2750 0    50   Input ~ 0
VSSIF
Text GLabel 6650 2750 2    50   Input ~ 0
TEST-GND
Text GLabel 5750 2650 0    50   Input ~ 0
TEST-GND
Text GLabel 6650 2650 2    50   Input ~ 0
VSSIF
Text GLabel 5750 2550 0    50   Input ~ 0
VDD1IF
Text GLabel 6750 2550 2    50   Input ~ 0
LV9A
Text GLabel 6750 2450 2    50   Input ~ 0
LV8A
Text GLabel 6750 2350 2    50   Input ~ 0
LV7A
Text GLabel 6750 2250 2    50   Input ~ 0
LV6A
Text GLabel 6750 2150 2    50   Input ~ 0
LV10A
Text GLabel 5650 2450 0    50   Input ~ 0
LV9B
Text GLabel 5650 2050 0    50   Input ~ 0
LV10B
Text GLabel 5650 2150 0    50   Input ~ 0
LV6B
Text GLabel 5650 2250 0    50   Input ~ 0
LV7B
Text GLabel 5650 2350 0    50   Input ~ 0
LV8B
Text GLabel 6650 2050 2    50   Input ~ 0
TEST-GND
Text GLabel 5750 1950 0    50   Input ~ 0
TEST-GND
Text GLabel 6650 1950 2    50   Input ~ 0
VSSIF
Text GLabel 5750 1850 0    50   Input ~ 0
VDD1IF
NoConn ~ 6650 1850
Text GLabel 5750 1750 0    50   Input ~ 0
IFSW
Text GLabel 5750 1650 0    50   Input ~ 0
VDD1-1.8V
Text GLabel 6650 1750 2    50   Input ~ 0
VDD1-1.8V
Text GLabel 6650 1650 2    50   Input ~ 0
VSS
Text GLabel 5750 1550 0    50   Input ~ 0
VSS
Text GLabel 6650 1550 2    50   Input ~ 0
TEST-GND
Text GLabel 5650 1450 0    50   Output ~ 0
VCAL
Text GLabel 6650 1450 2    50   BiDi ~ 0
R_IB
Text GLabel 5650 1350 0    50   Output ~ 0
VREF
Text GLabel 6750 1350 2    50   Output ~ 0
VG255
Text GLabel 5650 1250 0    50   Output ~ 0
VG0
Text GLabel 6750 1250 2    50   Output ~ 0
VOFS
Text GLabel 6650 1150 2    50   Input ~ 0
VSS
Text GLabel 5750 1150 0    50   Input ~ 0
VSS
Text GLabel 6650 1050 2    50   Input ~ 0
VDD2-10V
Text GLabel 5750 1050 0    50   Input ~ 0
VDD2-10V
Text GLabel 6800 950  2    50   Input ~ 0
VCCP_I
Text GLabel 5600 950  0    50   Input ~ 0
VCCP_I
Text GLabel 6650 850  2    50   Input ~ 0
VCATH
Text GLabel 5750 850  0    50   Input ~ 0
VCATH
Text GLabel 2350 2250 2    50   Output ~ 0
GND
Text GLabel 2350 3750 2    50   Output ~ 0
1.8V
Text GLabel 2350 4150 2    50   Output ~ 0
GND
Text GLabel 2350 5850 2    50   Output ~ 0
GND
Text GLabel 2350 5750 2    50   Output ~ 0
GND
Text GLabel 2350 5650 2    50   Output ~ 0
5V
Text GLabel 2350 5550 2    50   Output ~ 0
5V
Text GLabel 2350 5350 2    50   Output ~ 0
12.24V
Text GLabel 2350 5050 2    50   Output ~ 0
3.3V
Text GLabel 1350 950  0    50   Output ~ 0
GND
Text GLabel 1350 1250 0    50   Output ~ 0
GND
Text GLabel 1350 1550 0    50   Output ~ 0
GND
Text GLabel 1350 1850 0    50   Output ~ 0
GND
Text GLabel 1350 2150 0    50   Output ~ 0
GND
Text GLabel 1350 2450 0    50   Output ~ 0
GND
Text GLabel 1350 2750 0    50   Output ~ 0
GND
Text GLabel 1350 3050 0    50   Output ~ 0
GND
Text GLabel 1350 3350 0    50   Output ~ 0
GND
Text GLabel 1350 5150 0    50   Output ~ 0
GND
Text GLabel 1350 4850 0    50   Output ~ 0
GND
Text GLabel 1350 4550 0    50   Output ~ 0
GND
Text GLabel 1350 4250 0    50   Output ~ 0
GND
Text GLabel 1350 3950 0    50   Output ~ 0
GND
Text GLabel 1350 3650 0    50   Output ~ 0
GND
Text GLabel 1350 5250 0    50   Output ~ 0
29.1V
Text GLabel 1350 1650 0    50   Output ~ 0
DSI1_L3_P
Text GLabel 1350 1750 0    50   Output ~ 0
DSI1_L3_N
Text GLabel 1350 1950 0    50   Output ~ 0
DSI1_L2_P
Text GLabel 1350 2050 0    50   Output ~ 0
DSI1_L2_N
Text GLabel 1350 2250 0    50   Output ~ 0
DSI1_CLK_N
Text GLabel 1350 2350 0    50   Output ~ 0
DSI1_CLK_P
Text GLabel 1350 2550 0    50   Output ~ 0
DSI1_L1_P
Text GLabel 1350 2650 0    50   Output ~ 0
DSI1_L1_N
Text GLabel 1350 2850 0    50   Output ~ 0
DSI1_L0_N
Text GLabel 1350 2950 0    50   Output ~ 0
DSI1_L0_P
Text GLabel 1350 3150 0    50   Output ~ 0
DSI0_L0_N
Text GLabel 1350 3250 0    50   Output ~ 0
DSI0_L0_P
Text GLabel 1350 3450 0    50   Output ~ 0
DSI0_L1_N
Text GLabel 1350 3550 0    50   Output ~ 0
DSI0_L1_P
Text GLabel 1350 3750 0    50   Output ~ 0
DSI0_CLK_N
Text GLabel 1350 3850 0    50   Output ~ 0
DSI0_CLK_P
Text GLabel 1350 4050 0    50   Output ~ 0
DSI0_L2_N
Text GLabel 1350 4150 0    50   Output ~ 0
DSI0_L2_P
Text GLabel 1350 4350 0    50   Output ~ 0
DSI0_L3_N
Text GLabel 1350 4450 0    50   Output ~ 0
DSI0_L3_P
NoConn ~ 1350 4650
NoConn ~ 1350 4750
NoConn ~ 1350 4950
NoConn ~ 1350 5050
Text GLabel 2350 5450 2    50   Output ~ 0
5V
Text GLabel 2350 4950 2    50   Output ~ 0
3.3V
Text GLabel 2350 5150 2    50   Output ~ 0
GND
Text GLabel 2350 5250 2    50   Output ~ 0
GND
Text GLabel 4300 1350 0    50   Output ~ 0
DSI0_L0_N
Text GLabel 4300 1450 0    50   Output ~ 0
DSI0_L0_P
Text GLabel 4300 1650 0    50   Output ~ 0
DSI0_L1_N
Text GLabel 4300 1750 0    50   Output ~ 0
DSI0_L1_P
Text GLabel 4300 1050 0    50   Output ~ 0
DSI0_CLK_N
Text GLabel 4300 1150 0    50   Output ~ 0
DSI0_CLK_P
Text GLabel 4300 1950 0    50   Output ~ 0
DSI0_L2_N
Text GLabel 4300 2050 0    50   Output ~ 0
DSI0_L2_P
Text GLabel 4300 2250 0    50   Output ~ 0
DSI0_L3_N
Text GLabel 4300 2350 0    50   Output ~ 0
DSI0_L3_P
Text GLabel 4650 1050 2    50   Input ~ 0
LV1A
Text GLabel 4650 1350 2    50   Input ~ 0
LV2A
Text GLabel 4650 1650 2    50   Input ~ 0
LV3A
Text GLabel 4650 1950 2    50   Input ~ 0
LV4A
Text GLabel 4650 2250 2    50   Input ~ 0
LV5A
Text GLabel 4650 1450 2    50   Input ~ 0
LV2B
Text GLabel 4650 1750 2    50   Input ~ 0
LV3B
Text GLabel 4650 2050 2    50   Input ~ 0
LV4B
Text GLabel 4650 2350 2    50   Input ~ 0
LV5B
Text GLabel 4650 1150 2    50   Input ~ 0
LV1B
Wire Wire Line
	4300 1050 4650 1050
Wire Wire Line
	4300 1150 4650 1150
Wire Wire Line
	4300 1350 4650 1350
Wire Wire Line
	4300 1450 4650 1450
Wire Wire Line
	4300 1650 4650 1650
Wire Wire Line
	4300 1750 4650 1750
Wire Wire Line
	4300 1950 4650 1950
Wire Wire Line
	4300 2050 4650 2050
Wire Wire Line
	4300 2250 4650 2250
Wire Wire Line
	4300 2350 4650 2350
Text GLabel 1250 6400 0    50   Output ~ 0
1.8V
Text GLabel 1250 6800 0    50   Output ~ 0
GND
$Comp
L power:GND #PWR0101
U 1 1 5FC6813D
P 1450 6800
F 0 "#PWR0101" H 1450 6550 50  0001 C CNN
F 1 "GND" H 1455 6627 50  0000 C CNN
F 2 "" H 1450 6800 50  0001 C CNN
F 3 "" H 1450 6800 50  0001 C CNN
	1    1450 6800
	1    0    0    -1  
$EndComp
Wire Wire Line
	1250 6800 1450 6800
$Comp
L power:+1V8 #PWR0102
U 1 1 5FC689F6
P 1450 6400
F 0 "#PWR0102" H 1450 6250 50  0001 C CNN
F 1 "+1V8" H 1465 6573 50  0000 C CNN
F 2 "" H 1450 6400 50  0001 C CNN
F 3 "" H 1450 6400 50  0001 C CNN
	1    1450 6400
	1    0    0    -1  
$EndComp
Wire Wire Line
	1250 6400 1450 6400
Text GLabel 3850 3950 2    50   Input ~ 0
VDD2-10V
Text GLabel 3850 3850 2    50   Input ~ 0
VDD1-1.8V
Text GLabel 3850 3300 2    50   Input ~ 0
VSS
Text GLabel 3500 3850 0    50   Output ~ 0
1.8V
Text GLabel 3500 3300 0    50   Output ~ 0
GND
Wire Wire Line
	3500 3850 3850 3850
Wire Wire Line
	3500 3300 3850 3300
$Comp
L Connector_Generic:Conn_01x02 J2
U 1 1 5FC6D1A8
P 3450 4900
F 0 "J2" H 3530 4892 50  0000 L CNN
F 1 "Conn_01x02" H 3530 4801 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 3450 4900 50  0001 C CNN
F 3 "~" H 3450 4900 50  0001 C CNN
	1    3450 4900
	-1   0    0    1   
$EndComp
Wire Wire Line
	3650 4900 3850 4900
Text GLabel 3850 4900 2    50   Output ~ 0
GND
Text GLabel 3850 3750 2    50   Input ~ 0
VDD1IF
Text GLabel 3500 3750 0    50   Output ~ 0
1.8V
Wire Wire Line
	3500 3750 3850 3750
Text GLabel 3500 2800 0    50   Output ~ 0
GND
Text GLabel 3850 2800 2    50   Input ~ 0
VSSIF
Wire Wire Line
	3500 2800 3850 2800
Text GLabel 3850 2900 2    50   Input ~ 0
PSCNT
Text GLabel 3500 2900 0    50   Output ~ 0
GND
Wire Wire Line
	3500 2900 3850 2900
Text GLabel 3850 3000 2    50   Input ~ 0
IFSW
Text GLabel 3500 3000 0    50   Output ~ 0
GND
Wire Wire Line
	3500 3000 3850 3000
Text GLabel 3850 3100 2    50   Input ~ 0
TEST-GND
Text GLabel 3500 3100 0    50   Output ~ 0
GND
Wire Wire Line
	3500 3100 3850 3100
$Comp
L FF0881SA1-R3000:FF0881SA1-R3000 J4
U 1 1 5FC78A91
P 9500 850
F 0 "J4" H 9950 1115 50  0000 C CNN
F 1 "FF0881SA1-R3000" H 9950 1024 50  0000 C CNN
F 2 "custom_footprints:FF0881SA1R3000" H 10250 950 50  0001 L CNN
F 3 "http://www.jae.com/z-en/pdf_download_exec.cfm?param=SJ108178.pdf" H 10250 850 50  0001 L CNN
F 4 "FFC & FPC Connectors 81P 0.2MM FPC" H 10250 750 50  0001 L CNN "Description"
F 5 "1" H 10250 650 50  0001 L CNN "Height"
F 6 "JAE Electronics" H 10250 550 50  0001 L CNN "Manufacturer_Name"
F 7 "FF0881SA1-R3000" H 10250 450 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "" H 10250 350 50  0001 L CNN "Arrow Part Number"
F 9 "" H 10250 250 50  0001 L CNN "Arrow Price/Stock"
F 10 "656-FF0881SA1-R3000" H 10250 150 50  0001 L CNN "Mouser Part Number"
F 11 "https://www.mouser.co.uk/ProductDetail/JAE-Electronics/FF0881SA1-R3000?qs=e3doH35UsB4mcpzu8vQ7Tw%3D%3D" H 10250 50  50  0001 L CNN "Mouser Price/Stock"
	1    9500 850 
	1    0    0    -1  
$EndComp
NoConn ~ 9500 3850
NoConn ~ 9500 3550
NoConn ~ 10400 1850
Text GLabel 3850 3200 2    50   Input ~ 0
VCATH
Text GLabel 3500 3200 0    50   Output ~ 0
GND
Wire Wire Line
	3500 3200 3850 3200
Text GLabel 3950 5800 2    50   Input ~ 0
XCLR
Wire Wire Line
	3600 5800 3950 5800
Wire Wire Line
	3500 3950 3850 3950
$Comp
L power:+10V #PWR0103
U 1 1 5FCD814C
P 1450 6650
F 0 "#PWR0103" H 1450 6500 50  0001 C CNN
F 1 "+10V" H 1465 6823 50  0000 C CNN
F 2 "" H 1450 6650 50  0001 C CNN
F 3 "" H 1450 6650 50  0001 C CNN
	1    1450 6650
	1    0    0    -1  
$EndComp
Wire Wire Line
	3650 4800 3850 4800
Text GLabel 3500 3950 0    50   Output ~ 0
10V
Text GLabel 1250 6650 0    50   Output ~ 0
10V
Wire Wire Line
	1250 6650 1450 6650
Text GLabel 3850 4800 2    50   Output ~ 0
10V
Text GLabel 3850 4250 2    50   BiDi ~ 0
R_IB
Text GLabel 3500 4250 0    50   Output ~ 0
GND
$Comp
L Device:R R1
U 1 1 5FCE1BC3
P 3700 4250
F 0 "R1" V 3493 4250 50  0000 C CNN
F 1 "100k" V 3584 4250 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 3630 4250 50  0001 C CNN
F 3 "~" H 3700 4250 50  0001 C CNN
	1    3700 4250
	0    1    1    0   
$EndComp
Wire Wire Line
	3500 4250 3550 4250
Text GLabel 3850 4450 2    50   Input ~ 0
VCCP_I
$Comp
L Connector_Generic:Conn_01x02 J5
U 1 1 5FCE52A7
P 3450 4550
F 0 "J5" H 3530 4542 50  0000 L CNN
F 1 "Conn_01x02" H 3530 4451 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 3450 4550 50  0001 C CNN
F 3 "~" H 3450 4550 50  0001 C CNN
	1    3450 4550
	-1   0    0    1   
$EndComp
Wire Wire Line
	3650 4550 3850 4550
Wire Wire Line
	3650 4450 3850 4450
Text GLabel 3850 4550 2    50   Input ~ 0
VCCP_O
Text GLabel 9500 4750 0    50   Input ~ 0
VCATH
Text GLabel 10400 4850 2    50   Input ~ 0
VCATH
Text GLabel 10400 4750 2    50   Input ~ 0
VCCP_O2
Text GLabel 9400 4650 0    50   Input ~ 0
VCCP_I2
Text GLabel 10400 4650 2    50   Input ~ 0
VCCP_I2
Text GLabel 10400 4550 2    50   Input ~ 0
VDD2-10V
Text GLabel 9500 4550 0    50   Input ~ 0
VDD2-10V
Text GLabel 10400 4450 2    50   Input ~ 0
VSS
Text GLabel 10400 4350 2    50   Input ~ 0
VSS
Text GLabel 9500 4350 0    50   Input ~ 0
VSS
Text GLabel 9500 4450 0    50   Input ~ 0
VSS
Text GLabel 10400 4250 2    50   Input ~ 0
VDD1-1.8V
Text GLabel 9500 4250 0    50   Input ~ 0
VDD1-1.8V
Text GLabel 9500 4150 0    50   Input ~ 0
XCS2
Text GLabel 10400 4150 2    50   Input ~ 0
XSCK2
Text GLabel 9500 4050 0    50   Input ~ 0
SI2
Text GLabel 10400 4050 2    50   Output ~ 0
SO2
Text GLabel 9500 3950 0    50   Input ~ 0
PSCNT
Text GLabel 10400 3950 2    50   Input ~ 0
XCLR
Text GLabel 10400 3850 2    50   Input ~ 0
TEST-GND
Text GLabel 10400 3550 2    50   Input ~ 0
VDD1IF
Text GLabel 9500 3450 0    50   Input ~ 0
VSSIF
Text GLabel 10400 3350 2    50   Input ~ 0
LV1A2
Text GLabel 9500 3250 0    50   Input ~ 0
LV1B2
Text GLabel 10400 3250 2    50   Input ~ 0
LV2A2
Text GLabel 9500 2850 0    50   Input ~ 0
LV5B2
Text GLabel 10400 3150 2    50   Input ~ 0
LV3A2
Text GLabel 9500 2950 0    50   Input ~ 0
LV4B2
Text GLabel 10400 3050 2    50   Input ~ 0
LV4A2
Text GLabel 9500 3050 0    50   Input ~ 0
LV3B2
Text GLabel 10400 2950 2    50   Input ~ 0
LV5A2
Text GLabel 9500 3150 0    50   Input ~ 0
LV2B2
Text GLabel 10400 3750 2    50   Input ~ 0
TEST-GND
Text GLabel 10400 3650 2    50   BiDi ~ 0
TEST-GND
Text GLabel 9500 3750 0    50   Input ~ 0
TEST-GND
Text GLabel 9500 3650 0    50   Input ~ 0
TEST-GND
Text GLabel 10400 3450 2    50   Input ~ 0
TEST-GND
Text GLabel 9500 3350 0    50   Input ~ 0
TEST-GND
Text GLabel 10400 2850 2    50   Input ~ 0
VDD1IF
Text GLabel 9500 2750 0    50   Input ~ 0
VSSIF
Text GLabel 10400 2750 2    50   Input ~ 0
TEST-GND
Text GLabel 9500 2650 0    50   Input ~ 0
TEST-GND
Text GLabel 10400 2650 2    50   Input ~ 0
VSSIF
Text GLabel 9500 2550 0    50   Input ~ 0
VDD1IF
Text GLabel 10500 2550 2    50   Input ~ 0
LV9A2
Text GLabel 10500 2450 2    50   Input ~ 0
LV8A2
Text GLabel 10500 2350 2    50   Input ~ 0
LV7A2
Text GLabel 10500 2250 2    50   Input ~ 0
LV6A2
Text GLabel 10500 2150 2    50   Input ~ 0
LV10A2
Text GLabel 9400 2450 0    50   Input ~ 0
LV9B2
Text GLabel 9400 2050 0    50   Input ~ 0
LV10B2
Text GLabel 9400 2150 0    50   Input ~ 0
LV6B2
Text GLabel 9400 2250 0    50   Input ~ 0
LV7B2
Text GLabel 9400 2350 0    50   Input ~ 0
LV8B2
Text GLabel 10400 2050 2    50   Input ~ 0
TEST-GND
Text GLabel 9500 1950 0    50   Input ~ 0
TEST-GND
Text GLabel 10400 1950 2    50   Input ~ 0
VSSIF
Text GLabel 9500 1850 0    50   Input ~ 0
VDD1IF
Text GLabel 9500 1750 0    50   Input ~ 0
IFSW
Text GLabel 9500 1650 0    50   Input ~ 0
VDD1-1.8V
Text GLabel 10400 1750 2    50   Input ~ 0
VDD1-1.8V
Text GLabel 10400 1650 2    50   Input ~ 0
VSS
Text GLabel 9500 1550 0    50   Input ~ 0
VSS
Text GLabel 10400 1550 2    50   Input ~ 0
TEST-GND
Text GLabel 9400 1450 0    50   Output ~ 0
VCAL
Text GLabel 10400 1450 2    50   BiDi ~ 0
R_IB2
Text GLabel 9400 1350 0    50   Output ~ 0
VREF
Text GLabel 10500 1350 2    50   Output ~ 0
VG255
Text GLabel 9400 1250 0    50   Output ~ 0
VG0
Text GLabel 10500 1250 2    50   Output ~ 0
VOFS
Text GLabel 10400 1150 2    50   Input ~ 0
VSS
Text GLabel 9500 1150 0    50   Input ~ 0
VSS
Text GLabel 10400 1050 2    50   Input ~ 0
VDD2-10V
Text GLabel 9500 1050 0    50   Input ~ 0
VDD2-10V
Text GLabel 10500 950  2    50   Input ~ 0
VCCP_I2
Text GLabel 10400 850  2    50   Input ~ 0
VCATH
Text GLabel 9500 850  0    50   Input ~ 0
VCATH
Text GLabel 7900 1350 0    50   Output ~ 0
DSI1_L0_N
Text GLabel 7900 1450 0    50   Output ~ 0
DSI1_L0_P
Text GLabel 7900 1650 0    50   Output ~ 0
DSI1_L1_N
Text GLabel 7900 1750 0    50   Output ~ 0
DSI1_L1_P
Text GLabel 7900 1050 0    50   Output ~ 0
DSI1_CLK_N
Text GLabel 7900 1150 0    50   Output ~ 0
DSI1_CLK_P
Text GLabel 7900 1950 0    50   Output ~ 0
DSI1_L2_N
Text GLabel 7900 2050 0    50   Output ~ 0
DSI1_L2_P
Text GLabel 7900 2250 0    50   Output ~ 0
DSI1_L3_N
Text GLabel 7900 2350 0    50   Output ~ 0
DSI1_L3_P
Text GLabel 8250 1050 2    50   Input ~ 0
LV1A2
Text GLabel 8250 1350 2    50   Input ~ 0
LV2A2
Text GLabel 8250 1650 2    50   Input ~ 0
LV3A2
Text GLabel 8250 1950 2    50   Input ~ 0
LV4A2
Text GLabel 8250 2250 2    50   Input ~ 0
LV5A2
Text GLabel 8250 1450 2    50   Input ~ 0
LV2B2
Text GLabel 8250 1750 2    50   Input ~ 0
LV3B2
Text GLabel 8250 2050 2    50   Input ~ 0
LV4B2
Text GLabel 8250 2350 2    50   Input ~ 0
LV5B2
Text GLabel 8250 1150 2    50   Input ~ 0
LV1B2
Wire Wire Line
	7900 1050 8250 1050
Wire Wire Line
	7900 1150 8250 1150
Wire Wire Line
	7900 1350 8250 1350
Wire Wire Line
	7900 1450 8250 1450
Wire Wire Line
	7900 1650 8250 1650
Wire Wire Line
	7900 1750 8250 1750
Wire Wire Line
	7900 1950 8250 1950
Wire Wire Line
	7900 2050 8250 2050
Wire Wire Line
	7900 2250 8250 2250
Wire Wire Line
	7900 2350 8250 2350
Text GLabel 8250 4300 2    50   BiDi ~ 0
R_IB2
Text GLabel 7900 4300 0    50   Output ~ 0
GND
$Comp
L Device:R R2
U 1 1 5FD3FCF3
P 8100 4300
F 0 "R2" V 7893 4300 50  0000 C CNN
F 1 "100k" V 7984 4300 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 8030 4300 50  0001 C CNN
F 3 "~" H 8100 4300 50  0001 C CNN
	1    8100 4300
	0    1    1    0   
$EndComp
Wire Wire Line
	7900 4300 7950 4300
Text GLabel 8250 4500 2    50   Input ~ 0
VCCP_I2
$Comp
L Connector_Generic:Conn_01x02 J6
U 1 1 5FD3FCFB
P 7850 4600
F 0 "J6" H 7930 4592 50  0000 L CNN
F 1 "Conn_01x02" H 7930 4501 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 7850 4600 50  0001 C CNN
F 3 "~" H 7850 4600 50  0001 C CNN
	1    7850 4600
	-1   0    0    1   
$EndComp
Wire Wire Line
	8050 4600 8250 4600
Wire Wire Line
	8050 4500 8250 4500
Text GLabel 8250 4600 2    50   Input ~ 0
VCCP_O2
Text GLabel 9400 950  0    50   Input ~ 0
VCCP_I2
NoConn ~ 1350 5850
NoConn ~ 1350 5750
NoConn ~ 1350 5650
NoConn ~ 1350 5550
NoConn ~ 1350 5450
NoConn ~ 1350 5350
NoConn ~ 2350 4850
NoConn ~ 2350 4750
NoConn ~ 2350 4650
NoConn ~ 2350 4550
NoConn ~ 2350 4450
NoConn ~ 2350 4350
NoConn ~ 2350 4250
NoConn ~ 2350 4050
NoConn ~ 2350 3950
NoConn ~ 2350 3850
NoConn ~ 2350 3650
NoConn ~ 2350 3550
NoConn ~ 2350 3050
NoConn ~ 2350 2950
NoConn ~ 2350 2850
NoConn ~ 2350 2650
NoConn ~ 2350 2550
NoConn ~ 2350 2450
NoConn ~ 2350 2150
NoConn ~ 2350 2050
NoConn ~ 2350 1750
NoConn ~ 2350 1450
NoConn ~ 2350 950 
NoConn ~ 1350 1050
NoConn ~ 1350 1150
NoConn ~ 1350 1350
NoConn ~ 1350 1450
NoConn ~ 2350 1550
NoConn ~ 2350 1650
NoConn ~ 2350 1850
NoConn ~ 2350 1950
NoConn ~ 2350 2350
Text GLabel 2200 6700 0    50   Output ~ 0
3.3V
Text GLabel 2200 6600 0    50   Output ~ 0
12.24V
Text GLabel 2200 6500 0    50   Output ~ 0
5V
NoConn ~ 2400 6700
NoConn ~ 2400 6600
NoConn ~ 2400 6500
Wire Wire Line
	2400 6700 2200 6700
Wire Wire Line
	2400 6600 2200 6600
Wire Wire Line
	2400 6500 2200 6500
Text GLabel 2200 6400 0    50   Output ~ 0
29.1V
NoConn ~ 2400 6400
Wire Wire Line
	2400 6400 2200 6400
NoConn ~ 5750 4650
NoConn ~ 5600 4650
NoConn ~ 5750 950 
NoConn ~ 5600 950 
NoConn ~ 6800 950 
NoConn ~ 6650 950 
NoConn ~ 9500 950 
NoConn ~ 9400 950 
NoConn ~ 10500 950 
NoConn ~ 10400 950 
NoConn ~ 9500 4650
NoConn ~ 9400 4650
NoConn ~ 9500 2050
NoConn ~ 9500 2150
NoConn ~ 9500 2250
NoConn ~ 9500 2350
NoConn ~ 9500 2450
NoConn ~ 9400 2450
NoConn ~ 9400 2350
NoConn ~ 9400 2250
NoConn ~ 9400 2150
NoConn ~ 9400 2050
NoConn ~ 10400 2150
NoConn ~ 10400 2250
NoConn ~ 10400 2350
NoConn ~ 10400 2450
NoConn ~ 10400 2550
NoConn ~ 10500 2550
NoConn ~ 10500 2450
NoConn ~ 10500 2350
NoConn ~ 10500 2250
NoConn ~ 10500 2150
NoConn ~ 5650 2050
NoConn ~ 5650 2150
NoConn ~ 5650 2250
NoConn ~ 5650 2350
NoConn ~ 5650 2450
NoConn ~ 5750 2450
NoConn ~ 5750 2350
NoConn ~ 5750 2250
NoConn ~ 5750 2150
NoConn ~ 5750 2050
NoConn ~ 6650 2150
NoConn ~ 6650 2250
NoConn ~ 6650 2350
NoConn ~ 6650 2450
NoConn ~ 6650 2550
NoConn ~ 6750 2550
NoConn ~ 6750 2450
NoConn ~ 6750 2350
NoConn ~ 6750 2250
NoConn ~ 6750 2150
NoConn ~ 9400 1250
NoConn ~ 9400 1350
NoConn ~ 9400 1450
NoConn ~ 9500 1450
NoConn ~ 9500 1350
NoConn ~ 9500 1250
NoConn ~ 10500 1250
NoConn ~ 10500 1350
NoConn ~ 10400 1350
NoConn ~ 10400 1250
NoConn ~ 6750 1250
NoConn ~ 6750 1350
NoConn ~ 6650 1350
NoConn ~ 6650 1250
NoConn ~ 5650 1450
NoConn ~ 5650 1350
NoConn ~ 5650 1250
NoConn ~ 5750 1250
NoConn ~ 5750 1350
NoConn ~ 5750 1450
Text GLabel 3950 5950 2    50   Input ~ 0
XCS
Text GLabel 3950 6050 2    50   Input ~ 0
SI
Text GLabel 3950 6250 2    50   Input ~ 0
XSCK
Text GLabel 3950 6150 2    50   Output ~ 0
SO
Text GLabel 8250 5150 2    50   Input ~ 0
XCS2
Text GLabel 8250 5250 2    50   Input ~ 0
SI2
Text GLabel 8250 5450 2    50   Input ~ 0
XSCK2
Text GLabel 8250 5350 2    50   Output ~ 0
SO2
Text GLabel 2350 1050 2    50   Output ~ 0
BLSP12_B3_GPIO85_UART-TX
Text GLabel 2350 1150 2    50   Output ~ 0
BLSP12_B2_GPIO86_UART-RX
Text GLabel 2350 1250 2    50   Output ~ 0
BLSP12_B?_GPIO87_I2C_SDA
Text GLabel 2350 1350 2    50   Output ~ 0
BLSP12_B?_GPIO88_I2C_SCL
Text GLabel 2350 3150 2    50   Output ~ 0
BLSP10_B1_GPIO10
Text GLabel 2350 3250 2    50   Output ~ 0
BLSP10_B0_GPIO11
Text GLabel 2350 3350 2    50   Output ~ 0
BLSP10_B3_GPIO8
Text GLabel 2350 3450 2    50   Output ~ 0
BLSP10_B2_GPIO9
$EndSCHEMATC
