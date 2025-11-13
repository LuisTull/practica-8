# Imagen base de Ubuntu
FROM ubuntu:22.04

# Evitar prompts interactivos
ENV DEBIAN_FRONTEND=noninteractive

# Actualizar e instalar SSH y sudo
RUN apt-get update && apt-get install -y \
    openssh-server \
    sudo \
    && mkdir /var/run/sshd

# Crear usuario ansible con contraseña ansible
RUN useradd -m -s /bin/bash ansible && echo "ansible:ansible" | chpasswd

# Dar privilegios sudo sin contraseña al usuario ansible
RUN echo "ansible ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Habilitar SSH para el usuario ansible
RUN mkdir /home/ansible/.ssh && chmod 700 /home/ansible/.ssh

# Exponer puerto SSH
EXPOSE 22

# Comando para iniciar el servicio SSH
CMD ["/usr/sbin/sshd", "-D"]

