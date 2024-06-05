#ruledef register
{
    a => 0x0
    b => 0x1
}
#ruledef
{
    brk => 0x00
    jmp {zp:i8} => 0x01 @ zp
    jmp {addr:i16} => 0x02 @ le(addr)

    ld {r:register}, {imm:i8} => 0x1 @ r @ imm
    ld {r:register}, [{zp:i8}] => 0x1 @ (r + 2)`4 @ zp
    ld {r:register}, [{addr:i16}] => 0x1 @ (r + 4)`4 @ le(addr)

    sw a, b => 0x16
    sw b, a => 0x16
    sw {r:register}, {zp:i8} => 0x1 @ (r + 7)`4 @ zp
    sw {r:register}, {addr:i16} => 0x1 @ (r + 9)`4 @ le(addr)
    sw {zp1:i8}, {zp2:i8} => 0x1b @ zp1 @ zp2
    sw {zp:i8}, {addr:u16} => 0x1c @ zp @ le(addr)
    sw {addr:i16}, {zp:i8} => 0x1c @ zp @ le(addr)
    sw {addr1:i16}, {addr2:i16} => 0x1d @ le(addr1) @ le(addr2)

    str {r:register}, {zp:i8} => 0x2 @ r @ zp
    str {r:register}, {addr:i16} => 0x2 @ (r + 2)`4 @ le(addr)
    str {imm: i8}, {zp:i8} => 0x24 @ imm @ zp
    str {imm:i8}, {addr:i16} => 0x25 @ imm @ le(addr)
    str [{zp1:i8}], {zp2:i8} => 0x26 @ zp1 @ zp2
    str [{zp:i8}], {addr:i16} => 0x27 @ zp @ le(addr)
    str [{addr:i16}], {zp:i8} => 0x28 @ le(addr) @ zp
    str [{addr1:i16}], {addr2:i16} => 0x29 @ le(addr1) @ le(addr2)

    inc {r:register} => 0x3 @ r
    inc [{zp:i8}] => 0x32 @ zp
    inc [{addr:i16}] => 0x33 @ le(addr)
    dec {r:register} => 0x3 @ (r + 4)`4
    dec [{zp:i8}] => 0x36 @ zp
    dec [{addr:i16}] => 0x37 @ le(addr)

    add {r:register}, {imm:i8} => 0x4 @ r @ imm
    add {r:register}, [{zp:i8}] => 0x4 @ (r + 2)`4 @ zp
    add {r:register}, [{addr:i16}] => 0x4 @ (r + 4)`4 @ le(addr)
    add {zp:i8}, {imm:i8} => 0x46 @ zp @ imm
    add {zp1:i8}, [{zp2:i8}] => 0x47 @ zp1 @ zp2
    add {zp:i8}, [{addr:i16}] => 0x48 @ zp @ le(addr)
    add {addr:i16}, {imm:i8} => 0x49 @ le(addr) @ imm
    add {addr:i16}, [{zp:i8}] => 0x4a @ le(addr) @ zp
    add {addr1:i16}, [{addr2:i16}] => 0x4b @ le(addr1) @ le(addr2)

    sub {r:register}, {imm:i8} => 0x5 @ r @ imm
    sub {r:register}, [{zp:i8}] => 0x5 @ (r + 2)`4 @ zp
    sub {r:register}, [{addr:i16}] => 0x5 @ (r + 4)`4 @ le(addr)
    sub {zp:i8}, {imm:i8} => 0x56 @ zp @ imm
    sub {zp1:i8}, [{zp2:i8}] => 0x57 @ zp1 @ zp2
    sub {zp:i8}, [{addr:i16}] => 0x58 @ zp @ le(addr)
    sub {addr:i16}, {imm:i8} => 0x59 @ le(addr) @ imm
    sub {addr:i16}, [{zp:i8}] => 0x5a @ le(addr) @ zp
    sub {addr1:i16}, [{addr2:i16}] => 0x5b @ le(addr1) @ le(addr2)

    mul {r:register}, {imm:i8} => 0x6 @ r @ imm
    mul {r:register}, [{zp:i8}] => 0x6 @ (r + 2)`4 @ zp
    mul {r:register}, [{addr:i16}] => 0x6 @ (r + 4)`4 @ le(addr)
    mul {zp:i8}, {imm:i8} => 0x66 @ zp @ imm
    mul {zp1:i8}, [{zp2:i8}] => 0x67 @ zp1 @ zp2
    mul {zp:i8}, [{addr:i16}] => 0x68 @ zp @ le(addr)
    mul {addr:i16}, {imm:i8} => 0x69 @ le(addr) @ imm
    mul {addr:i16}, [{zp:i8}] => 0x6a @ le(addr) @ zp
    mul {addr1:i16}, [{addr2:i16}] => 0x6b @ le(addr1) @ le(addr2)

    and {r:register}, {imm:i8} => 0x7 @ r @ imm
    and {r:register}, [{zp:i8}] => 0x7 @ (r + 2)`4 @ zp
    and {r:register}, [{addr:i16}] => 0x7 @ (r + 4)`4 @ le(addr)
    and {zp:i8}, {imm:i8} => 0x76 @ zp @ imm
    and {zp1:i8}, [{zp2:i8}] => 0x77 @ zp1 @ zp2
    and {zp:i8}, [{addr:i16}] => 0x78 @ zp @ le(addr)
    and {addr:i16}, {imm:i8} => 0x79 @ le(addr) @ imm
    and {addr:i16}, [{zp:i8}] => 0x7a @ le(addr) @ zp
    and {addr1:i16}, [{addr2:i16}] => 0x7b @ le(addr1) @ le(addr2)

    or {r:register}, {imm:i8} => 0x8 @ r @ imm
    or {r:register}, [{zp:i8}] => 0x8 @ (r + 2)`4 @ zp
    or {r:register}, [{addr:i16}] => 0x8 @ (r + 4)`4 @ le(addr)
    or {zp:i8}, {imm:i8} => 0x86 @ zp @ imm
    or {zp1:i8}, [{zp2:i8}] => 0x87 @ zp1 @ zp2
    or {zp:i8}, [{addr:i16}] => 0x88 @ zp @ le(addr)
    or {addr:i16}, {imm:i8} => 0x89 @ le(addr) @ imm
    or {addr:i16}, [{zp:i8}] => 0x8a @ le(addr) @ zp
    or {addr1:i16}, [{addr2:i16}] => 0x8b @ le(addr1) @ le(addr2)
    
    xor {r:register}, {imm:i8} => 0x9 @ r @ imm
    xor {r:register}, [{zp:i8}] => 0x9 @ (r + 2)`4 @ zp
    xor {r:register}, [{addr:i16}] => 0x9 @ (r + 4)`4 @ le(addr)
    xor {zp:i8}, {imm:i8} => 0x96 @ zp @ imm
    xor {zp1:i8}, [{zp2:i8}] => 0x97 @ zp1 @ zp2
    xor {zp:i8}, [{addr:i16}] => 0x98 @ zp @ le(addr)
    xor {addr:i16}, {imm:i8} => 0x99 @ le(addr) @ imm
    xor {addr:i16}, [{zp:i8}] => 0x9a @ le(addr) @ zp
    xor {addr1:i16}, [{addr2:i16}] => 0x9b @ le(addr1) @ le(addr2)

    rol {r:register} => 0xa @ r
    rol [{zp:i8}] => 0xa2 @ zp
    rol [{addr:i16}] => 0xa3 @ le(addr)

    ror {r:register} => 0xa @ (r + 4)`4
    ror [{zp:i8}] => 0xa6 @ zp
}