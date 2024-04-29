asect 0x00

dc main, 0x00

main:
    ldi r0, 0xdead
    ldi r1, hw
    loop:
    ldb r1, r2
    tst r2
    bz stop
    stb r0, r2
    inc r1
    br loop
    stop:
   halt

hw: dc "Hello world!", 0x00
end.