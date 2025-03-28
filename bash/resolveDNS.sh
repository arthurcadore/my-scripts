#!/bin/bash

lista="lista_dominios.txt"
saida="resultados.txt"
max_jobs=50  # Quantidade máxima de processos paralelos
timeout=10 # Tempo limite para cada wget
counter=0 

# Limpa o arquivo de saída antes de começar
> "$saida"

semaforo() {
    while [ "$(jobs -r | wc -l)" -ge "$max_jobs" ]; do
        sleep 0.5
    done
}

while IFS= read -r url; do
    semaforo
    {
        counter=$((counter + 1))

        # Adiciona o número do teste ao início da linha
        echo "Test number $counter, URL: $url" | tee -a "$saida"
        wget --spider --timeout=$timeout --tries=1 "$url" &>> "$saida"
        echo "----------------------" >> "$saida"
    } &
done < "$lista"

# Espera todos terminarem
wait
echo "Todos os testes concluídos. Resultados em $saida."
