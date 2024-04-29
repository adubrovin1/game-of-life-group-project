asect 0x00

dc main, 0x00

main:
    ldi r0, 0xdead
    ldi r1, 0xbeef
    ldi r3, 0x20
    loop:
    ldb r1, r2
    tst r2
    bz loop
    xor r3, r2, r2
    stb r0, r2
    br loop
end.
