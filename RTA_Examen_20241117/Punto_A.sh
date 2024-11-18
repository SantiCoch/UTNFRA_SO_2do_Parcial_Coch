#!/bin/bash

sudo pvcreate /dev/sda /dev/sdb

sudo vgcreate vg_datos /dev/sda
sudo vgextend vg_datos /dev/sdb

sudo lvcreate -n lv_docker -L 5M vg_datos
sudo lvcreate -n lv_workareas -L 1.5G vg_datos
sudo lvcreate -n lv_swap -L 512M vg_temp

sudo mkfs.ext4 /dev/vg_datos/lv_docker
sudo mkfs.ext4 /dev/vg_datos/lv_workareas
sudo mkswap /dev/vg_temp/lv_swap

sudo mount /dev/vg_datos/lv_docker /var/lib/docker
sudo mount /dev/vg_datos/lv_workareas /work
sudo swapon /dev/vg_temp/lv_swap

echo '/dev/vg_datos/lv_docker /var/lib/docker ext4 defaults 0 0' | sudo tee -a /etc/fstab
echo '/dev/vg_datos/lv_workareas /work ext4 defaults 0 0' | sudo tee -a /etc/fstab
echo '/dev/vg_temp/lv_swap none swap sw 0 0' | sudo tee -a /etc/fstab

