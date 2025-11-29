
# Enhanced Manual Division Algorithm with Early Exit Optimization

.globl main
.data
newline: .asciiz "\n"
msg1: .asciiz "Quotient (Enhanced): "
msg2: .asciiz "Remainder (Enhanced): "
execTimeMsg: .asciiz "Execution Time (Enhanced): "

.text
main:
    li $v0, 4
    la $a0, msg1
    syscall

    mfc0 $t7, $9  # Start time

    li $t0, 300        # Dividend
    li $t1, 15         # Divisor
    move $t3, $zero    # Quotient
    move $t2, $zero    # Remainder
    li $t4, 32         # Loop counter

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

    mfc0 $t6, $9       # End time
    subu $t8, $t6, $t7 # Execution time

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
    move $a0, $t8
    syscall

    li $v0, 10
    syscall
