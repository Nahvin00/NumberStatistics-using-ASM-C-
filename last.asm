.data
	.align 4

	myArray: .space 80
	group_name: .asciiz "Group Name: Fire Breathing Rubber Duckies\n"
	group_mem: .asciiz "Group Members:\nNahvin\nZaid\nAnisa\nJeya\n\n"
	prompt: .asciiz "Please input 20 positive numbers:\n"
        msg_ao: .asciiz "The ascending order of all entered number:\n"
	msg_sum: .asciiz "\nThe sum of all entered number is:\n"
	msg_avg: .asciiz "\nThe average of number entered is: \n"
	msg_mavg: .asciiz "\nThe list of numbers that is more than average:\n"
	msg_lavg: .asciiz "\n\nThe list of numbers that is less than average:\n"
	msg_odd: .asciiz "\n\nThe list of odd numbers:\n"
	msg_even: .asciiz "\n\nThe list of even numbers:\n"
	msg_mul: .asciiz "\n\nThe multiplication between the highest and the lowest number is: "
	msg_div: .asciiz "\nThe division between the highest and the lowest number is: "
	msg_pt: .asciiz "\nThe list of programming techniques used:\n1.Array\n2.For loop\n3.Selection(if condition)"
        space: .asciiz " "
	dot: .asciiz "."
	newline: .asciiz "\n"
	
	size: .word 40
.text

.globl main

#$s1 = MyArray
#$t1 = i
#t2 = j
#$t2 = sum


main: 
li $v0,4
la $a0,group_name
syscall

li $v0,4
la $a0,group_mem
syscall

li $v0,4
la $a0,prompt
syscall



la $s1, myArray
ori $t5, $zero, 0
ori $s2, $zero, 0

loopinput:
la $a0, newline
li $v0, 5
syscall

sw $v0, 0($s1)
addi $s1, $s1, 4
addi $t1, $t1, 1
bne $t1, 20, loopinput


la $s1, myArray
sub $t1, $t1, $t1

li $v0, 4
la $a0, newline
syscall 

order1 :
beq $t2, 19, order2
lw $t3, 0($s1)
lw $t4, 4($s1)
addi $s1, $s1, 4
addi $t2, $t2, 1
bgt $t4, $t3, order1
sw $t3, 0($s1)
sw $t4, -4($s1)
bne $t2, 19, order1

order2 :
la $s1, myArray
addi $t1, $t1, 1
addi $t2, $t1, 0
bne $t1, 19, order1
li $v0, 4
la $a0, msg_ao
syscall

la $s1, myArray
sub $t1, $t1, $t1

orderfinal :
li $v0, 1
lw $a0, 0($s1)
syscall
addi $s1, $s1, 4
addi $t1, $t1, 1
li $v0, 4
la $a0, space
syscall
bne $t1, 20, orderfinal

sub $t1, $t1, $t1
la $s1, myArray

li $v0, 4
la $a0, newline
syscall 

SUM:

lw $t5, 0($s1)
add $s2, $t5, $s2
addi $s1, $s1, 4
addi $t1, $t1, 1
bne $t1, 20, SUM

li $v0, 4
la $a0,msg_sum
syscall

move $a0, $s2
li $v0, 1
syscall

sub $t1, $t1, $t1
la $s1 , myArray

li $v0, 4
la $a0, newline
syscall 

cal_average:

li $v0, 4
la $a0,msg_avg
syscall


div $s3, $s2,20

move $a0, $t3
li $v0, 1
syscall


li $v0, 4
la $a0, newline
syscall

li $v0, 4
la $a0, msg_mavg
syscall

loop_mavg:
lw $t4,0($s1)
bgt $t4,$s2, print1
blt $t4,$s2, next1
print1:
move $a0, $t4
li $v0, 1
syscall
li $v0, 4
la $a0, space
syscall
next1:
addi $s1, $s1, 4
addi $t1, $t1, 1
bne $t1, 20, loop_mavg

la $s1, myArray
sub $t1, $t1, $t1

li $v0, 4
la $a0, msg_lavg
syscall

loop_lavg:
lw $t4,0($s1)
blt $t4,$s2, print2
bgt $t4,$s2, next2
print2:
move $a0, $t4
li $v0, 1
syscall
li $v0, 4
la $a0, space
syscall
next2:
addi $s1, $s1, 4
addi $t1, $t1, 1
bne $t1, 20, loop_lavg

la $s1, myArray
sub $t1, $t1, $t1

li $v0, 4
la $a0, msg_odd
syscall

loop_odd:
lw $t2,0($s1)
addi $t3,$0,2
div $t2,$t3
mfhi $t6
bne $t6,$0, print3
beq $t6,$0, next3
print3:
move $a0, $t2
li $v0, 1
syscall
li $v0, 4
la $a0, space
syscall
next3:
addi $s1, $s1, 4
addi $t1, $t1, 1
bne $t1, 20, loop_odd

la $s1, myArray
sub $t1, $t1, $t1

li $v0, 4
la $a0, msg_even
syscall

loop_even:
lw $t2,0($s1)
addi $t3,$0,2
div $t2,$t3
mfhi $t6
beq $t6,$0, print4
bne $t6,$0, next4
print4:
move $a0, $t2
li $v0, 1
syscall
li $v0, 4
la $a0, space
syscall
next4:
addi $s1, $s1, 4
addi $t1, $t1, 1
bne $t1, 20, loop_even

la $s1, myArray
sub $t1, $t1, $t1

maxmin :

li $v0,4
la $a0,msg_mul
syscall

lw $t5,0($s1)
lw $t6,76($s1)
mult $t6,$t5
mfhi $t7
mflo $t8

move $a0, $t8
li $v0, 1
syscall

li $v0, 4
la $a0, newline
syscall

li $v0,4
la $a0,msg_div
syscall

div $t6,$t5
mfhi $t7
mflo $t8

move $a0, $t8
li $v0, 1
syscall

li $v0, 4
la $a0, dot
syscall

move $a0, $t7
li $v0, 1
syscall

li $v0, 4
la $a0, newline
syscall

li $v0, 4
la $a0, msg_pt
syscall