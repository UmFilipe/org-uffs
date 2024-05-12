    .data

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
    # (a + b > c) e (a + c > b) e (b + c > a): 
    add s3, s0, s1 # s3 = a + b
    add s4, s0, s3 # s4 = a + c
    add s5, s1, s2 # s5 = b + c

    bge s3, s2, primeira_condicao # a + b >= c
        j nao_forma 
primeira_condicao:
    beq s3, s2, nao_forma # a + b = c // nao forma triangulo
        j segunda_condicao 
segunda_condicao: # a + b > c
    bge s4, s1, terceira_condicao
        j nao_forma
terceira_condicao: 
     beq s4, s1, nao_forma # a + c = b // nao forma triangulo
        j quarta_condicao
quarta_condicao:
     bge s5, s0, quinta_condicao # b + c >= a
        j nao_forma
quinta_condicao:
     beq s5, s0, nao_forma # b + c = a // nao forma triangulo
        j forma
forma:
    li a0, 1
    j fim
nao_forma:
    li a0, 0
    j fim
fim:
    nop 