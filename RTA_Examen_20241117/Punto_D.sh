sudo mkdir -p /tmp/2do_parcial/alumno
sudo mkdir -p /tmp/2do_parcial/equipo

nano templates/datos_alumno.j2
nano templates/datos_equipo.j2
nano vars/main.yml
nano tasks/main.yml

sudo visudo
%2PSupervisores ALL=(ALL) NOPASSWD: ALL

ansible-playbook 2do_parcial.yml

cat /tmp/2do_parcial/alumno/datos_alumno.txt
cat /tmp/2do_parcial/equipo/datos_equipo.txt
sudo -l

