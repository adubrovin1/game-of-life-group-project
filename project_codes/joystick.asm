# r0 - column address
# r1 - y shift address
# r2 - column
# r3 - y shift
# r4 - 16 comparison
# r5 - shifted res
# r6 - shift count

asect 0x00

dc main, 0x00 # сюда прерывания

main:
    ldi r0, 0xbabe # column
    ldi r1, 0xbeef # y shift
    loop:
    ldw 0xbabe, r2
    ldw r1, r3
    ldi r5, 1
    ldi r6, 0
    tst r3
    bz loop
    ldi r4, 15
    if
        cmp r3, r4
    is gt
        inc r4
        sub r3, r4, r3
    fi
    while   
        cmp r3, r6
    stays gt
        shl r5, r5, 1
        inc r6
    wend
    xor r2, r5, r2
    stw r0, r2
    br loop
end.
