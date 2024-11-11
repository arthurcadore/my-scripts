## Passo 1: Criar um script de ajuste de data
Abra o Bloco de Notas.

Digite o seguinte comando para definir a data e a hora específicas (modifique a data conforme necessário):

```
batch
Copy code
@echo off
date 01-01-2023
time 12:00:00
Isso ajustará a data para 1º de janeiro de 2023 e a hora para 12:00:00.
```

Salve o arquivo com a extensão .bat (por exemplo, ajuste_relogio.bat).

## Passo 2: Adicionar o script à inicialização do Windows
Pressione Win + R, digite shell:startup e pressione Enter. Isso abrirá a pasta de inicialização do Windows.
Copie o arquivo .bat que você criou e cole-o nessa pasta.

## Passo 3: Permitir execução do script como administrador (opcional)
Se o script precisar de permissões de administrador para ajustar a data/hora, siga os passos abaixo:

Clique com o botão direito no arquivo .bat que você criou e escolha Criar atalho.
Clique com o botão direito no atalho e selecione Propriedades.
Na guia Atalho, clique em Avançado.
Marque a opção Executar como administrador e clique em OK.
Agora, toda vez que o Windows inicializar, o script será executado e a data/hora serão ajustadas para os valores especificados.