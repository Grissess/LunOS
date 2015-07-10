.extern _kmain

_start:
	mov $0776, sp
	jmp _kmain
	halt

__tester:
	mov $teststr, r0
Lread:
	tstb (r0)
	beq Lend
	movb (r0)+, *$0177566
Lwait:
	bit $0200, *$0177564
	beq Lwait
	br Lread
Lend:
	halt

teststr:
	.string "Hello from __tester!\r\nHE COMES"
