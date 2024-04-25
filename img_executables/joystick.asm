# r0 - column address
# r1 - y shift address
# r2 - column
# r3 - y shift
# r4 - firstly previous state, secondly 16 comparison
# r5 - firstly button address, secondly shifted res
# r6 - firstly button condition, secondly shift count

asect 0x00

dc main, 0x00 # сюда прерывания

main:
    ldi r0, 0xbabe # column
    ldi r1, 0xbeef # y shift
    ldi r5, 0xcafe # button adress
    push r4
    loop:
    ldw r5, r6
    pop r4
    tst r6
    push r6
    bz loop
    if
        cmp r6, r4
    is ne
        ldw r0, r2
        ldw r1, r3
        ldi r4, 15
        ldi r5, 1
        ldi r6, 0
        if
            cmp r3, r4
        is gt
            sub r3, 16
        fi
        while
            cmp r3, r6
        stays gt
            shl r5, r5, 1
            inc r6
        wend
        xor r2, r5, r2
        stw r0, r2
        ldi r5, 0xcafe
        ldi r6, 0
    fi
    br loop
end.
