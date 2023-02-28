#!/bin/bash

#Criando diretorios e grupos
mkdir /home/arquivos
mkdir /home/arquivos/publico /home/arquivos/adm /home/arquivos/ven /home/arquivos/sec

groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

#Configurando permissões de grupo nas pastas
chgrp GRP_ADM /home/arquivos/adm
chmod 770 /home/arquivos/adm

chgrp GRP_SEC /home/arquivos/sec
chmod 770 /home/arquivos/sec

chgrp GRP_VEN /home/arquivos/ven
chmod 770 /home/arquivos/ven

chgrp nobody /home/arquivos/publico
chmod 750 /home/arquivos/publico

#Criando usuários
useradd carlos -m -s /bin/bash -p $(openssl passwd senha) -G GRP_ADM
useradd maria -m -s /bin/bash -p $(openssl passwd senha) -G GRP_ADM
useradd joao -m -s /bin/bash -p $(openssl passwd senha) -G GRP_ADM

useradd debora -m -s /bin/bash -p $(openssl passwd senha) -G GRP_VEN
useradd sebastiana -m -s /bin/bash -p $(openssl passwd senha) -G GRP_VEN
useradd roberto -m -s /bin/bash -p $(openssl passwd senha) -G GRP_VEN

useradd josefina -m -s /bin/bash -p $(openssl passwd senha) -G GRP_SEC
useradd amanda -m -s /bin/bash -p $(openssl passwd senha) -G GRP_SEC
useradd rogerio -m -s /bin/bash -p $(openssl passwd senha) -G GRP_SEC

passwd carlos -e
passwd maria -e
passwd joao -e
passwd debora -e
passwd sebastiana -e
passwd roberto -e
passwd josefina -e
passwd amanda -e
passwd rogerio -e

#Colocando todos no nobody
usermod -a -G nobody carlos
usermod -a -G nobody maria
usermod -a -G nobody joao
usermod -a -G nobody debora
usermod -a -G nobody sebastiana
usermod -a -G nobody amanda
usermod -a -G nobody roberto
usermod -a -G nobody josefina
usermod -a -G nobody rogerio
