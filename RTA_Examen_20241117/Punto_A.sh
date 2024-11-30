

sudo pvcreate /dev/sdc1 /dev/sdb1 /dev/sdb2
sudo pvs
sudo vgcreate vg_datos /dev/sdc1
sudo vgcreate vg_temp /dev/sdb1 /dev/sdb2
sudo pvs

sudo lvcreate -n lv_docker -L 5M vg_datos
sudo lvcreate -n lv_workareas -L 1.5G vg_datos
sudo lvcreate -n lv_swap -L 512M vg_temp
sudo lvs

sudo mkswap /dev/mapper/vg_temp-lv_swap

sudo swapon /dev/mapper/vg_temp-lv_swap
sudo swapon -s
sudo mkfs.ext4 /dev/mapper/vg_datos-lv_docker
sudo mkfs.ext4 /dev/mapper/vg_datos-lv_workareas
sudo lsblk -l

sudo ls -l /var/lib/docker/

sudo mkdir -p /work
sudo mount /dev/vg_datos/lv_workareas /work
sudo mount /dev/vg_datos/lv_docker /var/lib/docker
df -h

echo '/dev/vg_datos/lv_docker /var/lib/docker ext4 defaults 0 0' | sudo tee -a /etc/fstab
echo '/dev/vg_datos/lv_workareas /work ext4 defaults 0 0' | sudo tee -a /etc/fstab
echo '/dev/vg_temp/lv_swap none swap sw 0 0' | sudo tee -a /etc/fstab

sudo systemctl restart docker
sudo systemctl status docker
