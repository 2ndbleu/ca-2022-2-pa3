#----------------------------------------------------------------
#
#  4190.308 Computer Architecture (Fall 2022)
#
#  Project
#
#  November 20, 2022
# 
#  Seongyeop Jeong (seongyeop.jeong@snu.ac.kr)
#  Jaehoon Shim (mattjs@snu.ac.kr)
#  IlKueon Kang (kangilkueon@snu.ac.kr)
#  Wookje Han (gksdnrwp@snu.ac.kr)
#  Jinsol Park (jinsolpark@snu.ac.kr)
#  Systems Software & Architecture Laboratory
#  Dept. of Computer Science and Engineering
#  Seoul National University
#
#----------------------------------------------------------------

##################
# void bmpresize(unsigned char *img_ptr, int h, int w, int k, unsigned char *out_ptr)
##################

	.globl bmpresize
bmpresize:
    addi    sp, sp, -32
    sw      ra, 28(sp)
.L0_1:
    slli    t4, a2, 1
    add     t4, t4, a2
    addi    t4, t4, 3
    andi    ra, t4, -4
    sra     a1, a1, a3
    sra     a2, a2, a3
    sw      a2, 20(sp)
.L1_0:
    sw      a1, 16(sp)
.L1_1:
    addi    t0, a0, 0
    sll     t4, ra, a3
    add     a0, a0, t4
    lw      a2, 20(sp)
.L2_0:
.L2_1:
    sw      zero, 0(sp)
    sw      zero, 4(sp)
    sw      zero, 8(sp)
    sw      t0, 12(sp)
.L3_0:
.L3_1:
    addi    t3, t0, 0
    addi    a1, zero, 1
    sll     a1, a1, a3
.L4_0:
.L4_1:
    addi    t1, sp, 8
.L5_0:
.L5_1:
    slli    t2, t3, 3
    andi    t4, t3, -4
    lw      t4, 0(t4)
    srl     t4, t4, t2
    lw      t2, 0(t1)
    andi    t4, t4, 255
    add     t2, t2, t4
    sw      t2, 0(t1)
.L5_8:
    addi    t3, t3, 1
    addi    t1, t1, -4
.L5_9:
    bge     t1, sp, .L5_0
.L4_9:
    addi    a1, a1, -1
    blt     zero, a1, .L4_0
.L3_8:
    add     t0, t0, ra
.L3_9:
    blt     t0, a0, .L3_0
.L2_6:
    addi    t0, sp, 8
.L6_0:
.L6_1:
    lw      a1, 0(t0)
    slli    t4, a3, 1
    srl     a1, a1, t4
    jal     t3, .st_char
.L6_8:
    addi    a4, a4, 1
    addi    t0, t0, -4
.L6_9:
    bge     t0, sp, .L6_0
.L2_8:
    lw      t0, 12(sp)
    addi    t4, zero, 3
    sll     t4, t4, a3
    add     t0, t0, t4
.L2_9:
    addi    a2, a2, -1
    blt     zero, a2, .L2_0
    addi    a1, zero, 0
.L1_8:
.padding:
    andi    t0, a4, 3
    beq     t0, zero, .L1_9
    jal     t3, .st_char
    addi    a4, a4, 1
    j       .padding
.L1_9:
    lw      a1, 16(sp)
    addi    a1, a1, -1
    blt     zero, a1, .L1_0
.L0_9:
    lw      ra, 28(sp)
    addi    sp, sp, 32
    ret

.st_char:
    slli    t4, a4, 3
    sll     a1, a1, t4
    addi    t2, zero, 255
    sll     t2, t2, t4
    xori    t2, t2, -1
    andi    t4, a4, -4
    lw      t1, 0(t4)
    and     t1, t1, t2
    or      t1, t1, a1
    sw      t1, 0(t4)
    jalr    x0, 0(t3)

#   <-- stack bottom = sp + 32
# sp+28 #   ra(orig.)
# sp+24 #   img_ptr
# sp+20 #   w >> k
# sp+16 #   i
# sp+12 #   j
# sp+8  #   B
# sp+4  #   G
# sp+0  #   R
#   <-- stack top = sp
