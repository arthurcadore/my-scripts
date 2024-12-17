#!/bin/bash

# How to configure it: 

# Copy the script to /usr/local/bin/ssh-log.sh
# Make it executable: chmod +x /usr/local/bin/ssh-log.sh

# Add the following line to your ~/.bashrc file:
# alias ssh='/usr/local/bin/ssh-log.sh'

# restart your terminal or run source ~/.bashrc to apply the changes.


# Diretório onde os logs serão armazenados
LOG_DIR="$HOME/ssh_logs"
mkdir -p "$LOG_DIR"

# Nome do arquivo de log baseado no hostname e data
LOG_FILE="$LOG_DIR/$(date '+%Y-%m-%d_%H-%M-%S')_$1.log"

# Iniciar o comando SSH e registrar a sessão
/usr/bin/script -q -c "ssh $@" "$LOG_FILE"


