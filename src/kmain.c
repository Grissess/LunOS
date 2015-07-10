extern void putc(char c);

void f(int a, int b, int c) {}

void kmain() {
	char *hello = "Hello from inside a PDP11!";
	char *c = hello;
	while(*c != '\0') {
		putc(*c);
		c++;
	}
	f(0, 1, 2);
}
