#!/usr/bin/env bash

cd /mnt/c/Users/lcst_henrique/Olho-de-Deus-main || exit 1

PYTHON="./.venv/bin/python"

if [ ! -x "$PYTHON" ]; then
    echo "Erro: ambiente Python .venv não encontrado."
    exit 1
fi

echo "===== OLHO DE DEUS ====="
echo "1 - Pipeline tradicional"
echo "2 - Pipeline agressivo"
echo "3 - Pipeline IA"
echo "0 - Sair"
read -r -p "Escolha: " opcao

case "$opcao" in
    1|2|3)
        read -r -p "URL do seu laboratório local: " alvo
        case "$alvo" in
            http://127.0.0.1:*|http://localhost:*|https://127.0.0.1:*|https://localhost:*)
                "$PYTHON" main.py "$alvo" --pipeline "$opcao"
                ;;
            *)
                echo "Por segurança, este script aceita somente localhost ou 127.0.0.1."
                echo "Use um laboratório local que você controla."
                exit 1
                ;;
        esac
        ;;
    0)
        echo "Saindo."
        ;;
    *)
        echo "Opção inválida."
        exit 1
        ;;
esac
