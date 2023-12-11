
.data
mem64a qword 0F701030508003A03h
mem64b qword 0D201030708003A05h

.code
Main proc
    movq mm0, mem64a ;MOVQ - Move Quadword
    movq mm1, mem64b ;MOVQ - Move Quadword

    ;PCMPEQB - Compare packed bytes for equal
    ;MM0 = 0xF701030508003A03
    ;MM1 = 0xD201030708003A05
    ;------------------------
    ;MM0 = 0x00ffff00ffffff00
    pcmpeqb mm0, mm1

    ;More:
    ;PCMPEQW - Compare packed words for equal.
    ;PCMPEQD - Compare packed doublewords for equal.
    ;PCMPGTB - Compare packed signed byte integers for greater than.
    ;PCMPGTW - Compare packed signed word integers for greater than.
    ;PCMPGTD - Compare packed signed doubleword integers for greater than.

    ret
Main endp
end
