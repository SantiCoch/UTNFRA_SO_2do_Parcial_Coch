#!/bin/bash


usuario_clave=$1
path_lista_usuarios=$2


while IFS=, read -r grupo usuario; do
    sudo groupadd $grupo

    sudo useradd -m -g $grupo -p $(echo $usuario_clave | openssl passwd -1 -stdin) $usuario
done < $path_lista_usuarios
