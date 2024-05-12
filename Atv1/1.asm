    .data

    a: .word 0
    b: .word 0
    c: .word 0

    .text

main: 
    li a10, 4
    ecall
    add s0, a0, zero
    ecall
    add s1, a1, zero
    ecall
    add s2, a2, zero
    ecall
    bge s0, s1, a_maior_que_b
    	j a_menor_que_b
a_maior_que_b:
    bge s0, s2, a_maior
a_menor_que_b:
    bge s1, s2, b_maior
fim:
    	nop 