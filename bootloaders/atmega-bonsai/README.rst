Bootloader for the Merkur Breakoutboard
=======================================

The MAC Address of the board is defined in the file::

    eui64.h

You have to edit this file to reflect the address that is printed on
your board.

Build the Bootloader for the Merkur Breakoutboard::

    make osd
    make osd_isp

These steps (calling the editor on ``eui64.h`` and calling the right
make steps above) is automated in the shell-script ``flash.sh``, just
call::

 flash.sh

Todo
----

To get the MAC address, the contiki application calls a routine in the
bootloader. The address of this routine ``get_mac`` is currently
hard-coded and depends on the compiler (where the compiler puts the
routine). This address should be put into a jump-table so that the
address can't change when the compiler (or compiler version) changes.
The current address is::

    0x0001f3a0                get_mac
