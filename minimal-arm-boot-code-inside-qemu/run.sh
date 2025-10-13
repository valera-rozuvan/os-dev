#!/bin/bash

qemu-system-arm \
    -M versatilepb \
    -m 128M \
    -nographic \
    -audio driver=none \
    -kernel ./test.bin

exit 0
