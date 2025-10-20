# littleosbook starter

This is a starter for the tutorial [GitHub :: littleosbook](https://github.com/littleosbook/littleosbook).

The first couple of chapters of the book [The little book about OS development](https://littleosbook.github.io/) are a bit outdated.

So I have managed to gather the bits and pieces to make it work on a latest Debian (v13.0).

## pre-reqs

Install the necessary packages first:

```shell
sudo apt install \
  make \
  gcc \
  nasm \
  bochsbios \
  vgabios \
  bochs \
  bochs-sdl \
  bochs-x \
  genisoimage \
  xorriso \
  mtools \
  grub-pc-bin
```

## building and running

Clone the git repository, then:

```shell
cd git_repository
make
make os.iso
make run
```

If you want to debug:

```shell
bochs -debugger
```

## running with qemu

First install QEMU for the `i386` architecture:

```shell
sudo apt install qemu-system qemu-system-x86
```

Then run like so:

```shell
qemu-system-i386 -boot d -cdrom os.iso -m 32 -audio driver=none
```
