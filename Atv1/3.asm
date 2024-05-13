    .data
    vetor: .word 1, 2, 5, 3, 2
    tamanho: .word 5
    .text

main:
    lw a1, tamanho
    la t0, vetor
    addi t1, t1, 0
    j loop
loop:
    bge t1, a1, fim_loop
    li a7, 1
    lw a0, (t0)
    ecall
    li a7, 11
    addi t0, t0, 4
    addi t1, t1, 1
    j loop
fim_loop: 
    j fim
fim: 
    nop
