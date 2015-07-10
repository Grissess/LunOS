CC = pdp11-aout-gcc
CCFLAGS = -nostdlib

AS = pdp11-aout-as
ASFLAGS =

OBJCOPY = pdp11-aout-objcopy

all: image.out _base.out

image.out : disk.img
	python utils/mkterp.py -o $@ -p 0x200 -d $^

_base.out : _disk_base.img
	python utils/mkterp.py -o $@ -p 0x200 -O 0x200 -d $^

disk.img _disk_base.img : disk.o
	$(OBJCOPY) -Obinary disk.o _disk_base.img
	dd if=/dev/zero of=512zeros count=1 bs=512
	cat 512zeros _disk_base.img > disk.img
	rm -f 512zeros

disk.o : init.o kmain.o ttio.o
	$(CC) $(CCFLAGS) -Wl,-Timage.ld -o $@ $^

%.o : src/%.c
	$(CC) $(CCFLAGS) -c -o $@ $^

%.o : src/%.s
	$(AS) $(ASFLAGS) -o $@ $^
