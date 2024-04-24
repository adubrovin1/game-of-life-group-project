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
        if
            cmp r3, r4
        is gt
            inc r4
            sub r3, r4, r3
        fi
        ldi r6, 0 # checking 0
        if 
            cmp r3, r6 
        is eq
            br shifted
        fi
        ldi r6, 1 # checking 1
        if 
            cmp r3, r6 
        is eq
            shl r5, r5, 1
            br shifted
        fi
        ldi r6, 2 # checking 2
        if 
            cmp r3, r6 
        is eq
            shl r5, r5, 2
            br shifted
        fi
        ldi r6, 3 # checking 3
        if 
            cmp r3, r6 
        is eq
            shl r5, r5, 3
            br shifted
        fi
        ldi r6, 4 # checking 4
        if 
            cmp r3, r6 
        is eq
            shl r5, r5, 4
            br shifted
        fi
        ldi r6, 5 # checking 5
        if 
            cmp r3, r6 
        is eq
            shl r5, r5, 5
            br shifted
        fi
        ldi r6, 6 # checking 6
        if 
            cmp r3, r6 
        is eq
            shl r5, r5, 6
            br shifted
        fi
        ldi r6, 7 # checking 7
        if 
            cmp r3, r6 
        is eq
            shl r5, r5, 7
            br shifted
        fi
        ldi r6, 8 # checking 8
        if 
            cmp r3, r6 
        is eq
            shl r5, r5, 8
            br shifted
        fi
        ldi r6, 9 # checking 9
        if 
            cmp r3, r6 
        is eq
            shl r5, r5, 8
            shl r5, r5, 1
            br shifted
        fi
        ldi r6, 10 # checking 10
        if 
            cmp r3, r6 
        is eq
            shl r5, r5, 8
            shl r5, r5, 2
            br shifted
        fi
        ldi r6, 11 # checking 11
        if 
            cmp r3, r6 
        is eq
            shl r5, r5, 8
            shl r5, r5, 3
            br shifted
        fi
        ldi r6, 12 # checking 12
        if 
            cmp r3, r6 
        is eq
            shl r5, r5, 8
            shl r5, r5, 4
            br shifted
        fi
        ldi r6, 13 # checking 13
        if 
            cmp r3, r6 
        is eq
            shl r5, r5, 8
            shl r5, r5, 5
            br shifted
        fi
        ldi r6, 14 # checking 14
        if 
            cmp r3, r6 
        is eq
            shl r5, r5, 8
            shl r5, r5, 6
            br shifted
        fi
        ldi r6, 15 # checking 15
        if 
            cmp r3, r6 
        is eq
            shl r5, r5, 8
            shl r5, r5, 7
            br shifted
        fi
        ldi r6, 16 # checking 16
        if 
            cmp r3, r6 
        is eq
            shl r5, r5, 8
            shl r5, r5, 8
            br shifted
        fi
        shifted:
        xor r2, r5, r2
        stw r0, r2
        ldi r5, 0xcafe
        ldi r6, 0
    fi
    br loop
end.
