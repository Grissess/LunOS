ttio_icsr = 0177560
ttio_idat = 0177562
ttio_ocsr = 0177564
ttio_odat = 0177566

.globl _putc
_putc:
	mov 2(sp), *$ttio_odat
putc_wait:
	bit $0200, *$ttio_ocsr
    beq putc_wait
	rts pc

