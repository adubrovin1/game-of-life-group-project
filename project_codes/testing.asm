asect 0x00

dc main, 0x00

main:
    ldi r0, 69
    ldi r1, 69
    add r0, r1, r2
    ldi r3, 50
    stw r3, r2
    halt
end.
