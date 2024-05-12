    .data

    a: .word 0
    b: .word 0
    c: .word 0

    .text

main: 
    li a7, 5
    ecall
    mv s0, a0 # s0 = a0
    ecall
    mv s1, a0 # s1 = b
    ecall
    mv s2, a0 # s2 = c
    j forma_triangulo
forma_triangulo:
    # (a + b > c) and (a + c > b) and (b + c > a): 
    add s3, s0, s1 # s3 = a + b
    add s4, s0, s3 # s4 = a + c
    add s5, s1, s2 # s5 = b + c

    bge s3, s2, primeira_condicao
        j fim
primeira_condicao:
    bge s4, s1, segunda_condicao
        j fim
segunda_condicao:
    bge s5, s0, ok
        j fim
ok:
    li a0, 1
    j fim
fim:
    nop 