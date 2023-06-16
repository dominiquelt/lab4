#!/bin/bash

function help() {
    echo "Usage: $0 [OPTIONS]"
    echo "OPTIONS: "
    echo " -d, --date      dzisiejsza data"
    echo " -l, --logs [NUM]  aby utworzyc 100 lub n plikow, zapisac nazwe pliku, nazwe skryptu i date do utworzonego pliku"
    echo " -h, --help      pomoc"
    echo " -e, --error [NUM]  plik error "
    echo " --init           klonowanie repozytorium"
    echo ""
}

function logs() {
    num_files=${1:-100}

    for i in $(seq 1 $num_files); do
           echo "plik: log$i.txt" > log$i.txt
           echo "skrypt: $0" >> log$i.txt
           echo "data: $(date)" >> log$i.txt
    done

    echo "$num_files log files created."
}

function error() {
    num_files=${1:-100}

    for i in $(seq 1 $num_files); do
        echo "nzawap liku: error$i.txt" > error$i.txt
        echo "utworzonp: $0" >> error$i.txt
        echo "data: $(date)" >> error$i.txt
    done

    echo "$num_files error files created"
}

if [[ "$1" == "--help" || "$1" == "-h" ]]; then
    help
elif [[ "$1" == "--date" || "$1" == "-d" ]]; then
    echo "Today's date: $(date)"
elif [[ "$1" == "--logs" || "$1" == "-l" ]]; then
    if [[ -z "$2" ]]; then
        logs
    else
        logs "$2"
    fi
elif [[ "$1" == "--error" || "$1" == "-e" ]]; then
    if [[ -z "$2" ]]; then
        error
    else
        error "$2"
    fi
elif [[ "$1" == "--init" ]]; then
    git clone git@github.com:SimpKala/Lab4.git
    export PATH=$PATH:$(pwd)/Lab4/bash-scripts
else
    echo "Invalid option. Use --help or -h to display the help menu."
fi
