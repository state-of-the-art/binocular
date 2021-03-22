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
