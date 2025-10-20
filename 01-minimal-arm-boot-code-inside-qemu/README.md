# minimal ARM boot code inside QEMU

Trying to reproduce something found on the Internet. COmpile some assembly code for the ARM, load it up into QEMU, and see `Hello world!` as output.

## pre-requisites

There is a handy script `install-deps.sh`. It installs everything necessary if you are on a Debian based OS. Tested on Debian v13.0.

## running

Launch the script `run.sh`. You should see `Hello world!`.

To kill it, find the process ID via `ps aux | grep -i [q]emu`, and kill it with `kill $PID`.

## debug

First, run `db-multiarch`, and enter the following commands once inside GDB:

```text
set architecture arm
file test.elf
target remote localhost:1234
```

Second, run the script `debug.sh` in a separate terminal.

Once it's up and running, return to the GDB window, and enter the command `c` (continue).


You should see something like this in the terminal with GDB:

```text
(gdb) set architecture arm
The target architecture is set to "arm".
(gdb) file test.elf
Reading symbols from test.elf...
(gdb) target remote localhost:1234
Remote debugging using localhost:1234
0x00000000 in ?? ()
(gdb) c
Continuing.

```

And in the terminal with QEMU, you should see `Hello world!`.

## resources

- https://balau82.wordpress.com/2010/02/28/hello-world-for-bare-metal-arm-using-qemu/
- https://rechtzeit.wordpress.com/2012/06/16/a-simple-bare-metal-program-arm/
- https://lists.gnu.org/archive/html/qemu-arm/2022-05/msg00382.html
- https://www.jehtech.com/qemu.html
- https://minghuasweblog.wordpress.com/2013/05/27/hello-world-for-bare-metal-arm-using-qemu/
- https://jcomes.org/aarch64-os-hello_world
- https://www.bravegnu.org/gnu-eprog/hello-arm.html
- https://web.archive.org/web/20241203043618/https://firmanhp.com/blog/posts/raspi-bare-metal/
- https://github.com/freedomtan/aarch64-bare-metal-qemu
- https://community.arm.com/arm-community-blogs/b/architectures-and-processors-blog/posts/hello-world-with-bare-metal-and-qemu
- https://github.com/idoth2o/arm_bare_boot
- https://mars-research.github.io/posts/2020/10/hello-world-on-bare-metal/
- https://stackoverflow.com/questions/65896336/how-to-compile-baremetal-hello-world-c-and-run-it-on-qemu-system-aarch64
