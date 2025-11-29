
.globl main
.data
newline: .asciiz "\n"
msg3: .asciiz "Quotient (div): "
msg4: .asciiz "Remainder (div): "
execTimeMsg2: .asciiz "Execution Time (div): "

.text
main:
    li $v0, 4
    la $a0, msg3
    syscall

    mfc0 $t7, $9

    li $t0, 300
    li $t1, 15
    div $t0, $t1
    mflo $t2
    mfhi $t3

    mfc0 $t6, $9
    subu $t8, $t6, $t7

    li $v0, 1
    move $a0, $t2
    syscall

    li $v0, 4
    la $a0, newline
    syscall

    li $v0, 4
    la $a0, msg4
    syscall
    li $v0, 1
    move $a0, $t3
    syscall

    li $v0, 4
    la $a0, newline
    syscall

    li $v0, 4
    la $a0, execTimeMsg2
    syscall
    li $v0, 1
    move $a0, $t8
    syscall

    li $v0, 10
    syscall
