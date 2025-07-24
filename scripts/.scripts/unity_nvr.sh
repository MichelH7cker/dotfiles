#!/usr/bin/env bash
# unity_nvim.sh
# $1 = caminho completo do arquivo, $2 = número da linha (sem o '+', que o Unity não inclui)
nvim-qt "$1" +"$2"
