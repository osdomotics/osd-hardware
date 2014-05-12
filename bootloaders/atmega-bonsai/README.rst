Bootloader for the Merkur Breakoutboard
=======================================

The EUI-64 Address of the board is computed from the MAC address, for
details, see the `Wikipedia`_ article on MAC addresses and the algorithm
described there to convert a MAC-48 into an EUI-64. When building the
bootloader you should specify the EUI-64 address.

.. _`Wikipedia`: http://en.wikipedia.org/wiki/MAC_address

You have to specify the EUI-64 on the command line when building
the bootloader to reflect the address that is printed on your board.

Build the Bootloader for the Merkur Breakoutboard, replace the given
``EUI64_ADDRESS`` with the one printed on your board::

    make osd EUI64_ADDRESS=00:50:56:FF:FF:03:04:05
    make osd_isp

These steps (prompting the user for the MAC address and calling the
right make steps above) is automated in the shell-script ``flash.sh``,
just call::

 flash.sh

To get the EUI64 address, the contiki application calls a routine in the
bootloader.

Previously the address of this routine ``get_mac`` was
hard-coded and depended on the compiler (where the compiler puts the
routine). This address is now in a jump-table so that the
address can't change when the compiler (or compiler version) changes.
The previously hard-coded address was::

    0x0001f3a0                get_mac

The new address in the jump-table is::

    0x0001ff80                get_mac

