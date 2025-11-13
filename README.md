# practica-8
practica 8


docker build -t ubuntu-ansible .

docker compose up -d

cd ansible

ansible-playbook setup.yml

ssh ansible@127.0.0.1 -p 2221

htop

sudo cat /home/itla/app/hola.txt
