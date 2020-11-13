#!/bin/bash
#set -x
#########################################################################
# Nome: proximaSexta.sh                                                 #
#                                                                       #
# Autor: Alexandre AlSil                                                #
# Data: 02/04/2020                                                      #
# Versão 1.0                                                            #
#                                                                       #
# Descrição: Quanto tempo falta para sexta-feira!                       #
#########################################################################

function show_help() {
   echo
   echo "#############################################################"
   echo "# Parametros Aguardados:                                    #"
   echo "# 1- <exec> para executar o script                          #"
   echo "# 2- [--help] ou [-h] para ajuda                            #"
   echo "# 3- Não Beba Heinecken com CocaCola                        #"
   echo "#############################################################"
   echo
}


function informe_me_please() {

local diaD hoje horas minutos dias segundos

diaD=$(date -d "next fri" +%s)
hoje=$(date +%s)

tempoFaltante=$(( $diaD - $hoje))
dias=$(($tempoFaltante / 86400))
tempoFaltante=$(($tempoFaltante-$(($dias * 86400))))
horas=$(($tempoFaltante / 3600))
tempoFaltante=$(($tempoFaltante-$((horas * 3600))))
minutos=$(($tempoFaltante / 60))
tempoFaltante=$(($tempoFaltante-$((minutos * 60))))
segundos=$tempoFaltante

echo "Faltam exatamente: $dias dias + $horas horas + $minutos minutos + $segundos segundos"
echo "para começar oficialmente a sexta-feira!"
echo "Aguente firme guerreiro!!!! "


}


function main() {
case $1 in
   --help | -h)
      echo
      echo " -- Executando Help -- "
      show_help
      ;;

   exec)
      informe_me_please
      ;;

   *)
      echo
      echo " -- Parametro Incorreto -- "
      show_help
      ;;

esac
}

main $1
