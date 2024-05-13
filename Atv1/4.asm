    .data
    vetor: .word -4, 2, 5, 1, 0
    tamanho: .word 5
    .text

main:
    lw a1, tamanho
    la a0, vetor
    mv t0, a0
    j ordena

ordena:
    li t2, 1  # Flag para verificar se houve troca
    li t3, 0  # Índice de loop externo
    li t4, 0  # Índice de loop interno
    
    externo:
        li t2, 0  # Reseta a flag de troca
        li t4, 0  # Reinicia o índice de loop interno
        
        interno:
            blt t4, a1, continue  # Verifica se o loop interno alcançou o final do vetor
            
            lw t5, 0(t0)  # vetor[i]
            lw t6, 4(t0)  # vetor[i+1]

            blt t5, t6, nao_trocar  # Se vetor[i] < vetor[i+1], não troca
            sw t6, 0(t0)  # Troca vetor[i] por vetor[i+1]
            sw t5, 4(t0)  # Troca vetor[i+1] por vetor[i]
            
            li t2, 1  # Seta a flag de troca
            
            nao_trocar:
                addi t0, t0, 4   # Avança para o próximo elemento do vetor
                addi t4, t4, 1   # Incrementa o índice de loop interno
                j interno

        continue:
            beqz t2, fim_externo  # Se não houve trocas (t2 = 0), termina o loop externo
            addi t3, t3, 1  # Incrementa o índice de loop externo
            li t4, 0  # Reinicia o índice de loop interno
            j externo

    fim_externo:
        j fim
fim:
    nop
