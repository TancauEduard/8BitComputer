#include "rules.asm"

addr = 0x8000

str 0x22, addr
ld a, 0x11
add a, [addr]
switch a, b
inc [addr]
