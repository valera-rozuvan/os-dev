volatile unsigned int * const UART0DR = (unsigned int *)0x101f1000;

void print_uart0(const char *s) {
  // loop until end of string
  while(*s != '\0') {

    // transmit char
    *UART0DR = (unsigned int)(*s);

    // switch to the next character
    s++;
  }
}

void c_entry() {
  print_uart0("Hello world!\n");
}
