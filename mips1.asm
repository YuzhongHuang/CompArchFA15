addi $a0, $a0, 2 
jal Fibon
syscall 

Fibon:

# branch if parameter equals 0 or 1
ble $a0, 0, End1
ble $a0, 1, End2

# store previous $ra and $a0 to stack
addi $sp, $sp, -8
sw $ra, 4($sp)
sw $a0, 0($sp)

# call Fibon($a0 - 1) for branch 1
addi $a0, $a0, -1
jal Fibon

# when Fibon branch 1 returns, store $v0 to stack
addi $sp, $sp, -4
sw $v0, 0($sp)

#load $a0
sw $a0, 4($sp)

# call Fibon($a0 - 2) for branch 2
addi $a0, $a0, -2
jal Fibon

# when Fibon branch 2 returns, add $v0 with the return value of branch 1
lw $v1, 0($sp)
addi $sp, $sp, 4
add $v0, $v0, $v1

lw $ra, 4($sp)
lw $a0, 0($sp)
addi $sp, $sp, 8

jr $ra

End1:
addi $v0, $zero, 0
jr $ra

End2:
addi $v0, $zero, 1
jr $ra