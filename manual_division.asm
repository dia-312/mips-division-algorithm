
.globl main
.data
newline: .asciiz "\n"
msg1: .asciiz "Quotient: "
msg2: .asciiz "Remainder: "
execTimeMsg: .asciiz "Execution Time (manual): "

.text
main:
    li $v0, 4
    la $a0, msg1
    syscall

    mfc0 $t7, $9

    li $t0, 300
    li $t1, 15
    move $t3, $zero
    move $t2, $zero
    li $t4, 32

loop:
    sll $t2, $t2, 1
    srl $t5, $t0, 31
    or  $t2, $t2, $t5
    sll $t0, $t0, 1
 
    sub $t6, $t2, $t1
    bgez $t6, remainder_pos

remainder_neg:
    sll $t3, $t3, 1
    j next

remainder_pos:
    move $t2, $t6
    sll $t3, $t3, 1
    ori $t3, $t3, 1

next:
    subi $t4, $t4, 1
    bnez $t4, loop

    mfc0 $t6, $9
    subu $t8, $t6, $t7

    li $v0, 1
    move $a0, $t3
    syscall

    li $v0, 4
    la $a0, newline
    syscall

    li $v0, 4
    la $a0, msg2
    syscall
    li $v0, 1
    move $a0, $t2
    syscall

    li $v0, 4
    la $a0, newline
    syscall

    li $v0, 4
    la $a0, execTimeMsg
    syscall
    li $v0, 1
    move $a0, $t6
    syscall

    li $v0, 10
    syscall
