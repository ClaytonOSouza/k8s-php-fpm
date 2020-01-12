# Kubernetes - PHP

Este repositório é um exemplo de uma aplicação composta de um pod com três contêineres:

- **cloner** - Transfere o código de um repositório para dentro do contêiner.
- **lighttpd** - Servidor web para arquivos estáticos, transfere a execução dos arquivos *.php* para o contêiner **php** através do endereço **localhost:9000**.
- **php** - Executa os arquivos *.php* e retorna o resultado para o **lighttpd**.

Um volume do tipo **emptyDir** é compartilhado entre todos os contêineres.

## Segurança

Alguns cuidados extras foram tomados para que as imagens da aplicação funcionassem com usuários não privilegiados.

## Cloner

O **cloner** é um contêiner baseado em **alpine** que utiliza um **secret** criado com o comando:

	kubectl create secret generic git-key --from-file key.pem

Este **secret** é montado dentro do contêiner, que aceita automaticamente a chave de um git remoto e então clona o repositório dentro do volume.

## Lighttpd

O **lighttpd** é um contêiner baseado em alpine com uma instalação mínima do Lighttpd pronta para se comunicar com o processo do **php-fpm**. A raíz do servidor web é o volume compartilhado.

## PHP

O **php** é um contêiner baseado em alpine com uma instalação mínima do php-fpm e algumas dependências em comun das minhas aplicações. O processo também utiliza o volume compartilhado.
Além do volume, este contêiner possui dois **ConfigMap** montados dentro de sí, um deles para o *php.ini* e outro para o **pool** do **php-fpm** chamado *www.conf*.
