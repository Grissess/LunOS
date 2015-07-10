ENTRY(_kmain)
SECTIONS {
	. = 0x200;
	.text : {
		*(.text)
	}

	.data : {
		*(.data)
	}

	.bss : {
		*(.bss)
	}
}
