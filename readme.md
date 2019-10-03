# Composições para containers Benner

Neste repositório estamos descrevendo nossas composições de containers para agilizar a adoção e facilitar o provisionamento de ambientes.

## Disclaimer

Cada projeto/ambiente possiu suas particularidades, esse material serve como _quickstarter_, com foco mais para ambientes de desenvolvimento. É importante revisar as configurações para ambientes de produção.
A princípio estamos sugerindo apenas componentes de terceiros com licença free. É importante revisar os componentes que serão utilizados em seu projeto em produção.

## docker-compose-linux.yml

Este [arquivo](./docker-compose-linux.yml) armazena alguns componentes da nossa arquitetura que podem ser executados em containers linux.
Também é possível utilizar outros componentes para atender as necessidades. Esse _stack_ é apenas uma sugestão, caso você não precise de algum componente sinta-se livre para _forkar_ e adaptar o compose conforme sua necessidade.

- [elasticsearch](https://hub.docker.com/_/elasticsearch) - utilizado para armazenamento e indexação principalmente de logs
- [kibana](https://hub.docker.com/_/kibana) - plataforma para visualização de dados do elasticsearch
- [redis](https://hub.docker.com/_/redis) - utilizado principalmente para armazenar sessão de usuários do WES
- [rabbitMQ](https://hub.docker.com/_/rabbitmq) - utilizado como broker de mensageria
- [portainer](https://hub.docker.com/r/portainer/portainer) - utilizado como interface para gerenciar seu Docker host e Swarm cluster
- [keycloak](https://hub.docker.com/r/jboss/keycloak) - utilizado como servidor de identidade
- [postgreSQL](https://hub.docker.com/_/postgres) - utilizado como banco de dados relacional para os sistemas benner
- [adminer](https://hub.docker.com/_/adminer) - utilizado como interface para gerenciar bancos de dados

## Executando o compose linux

Entre no terminal linux, geralmente pelo comando `ssh root@[hostname]`, então vá até o diretório raiz, geralmente pelo comando `cd /`.

Faça o `clone` deste repositório:

``` bash
git clone --progress -v "https://github.com/benner-sistemas/containers.git"
```

Após clonar o repositório, entre no diretório, com o comando `cd containers`.

Agora basta executar o compose linux, através do seguinte comando:

``` bash
docker-compose -f docker-compose-linux.yml up -d
```

Se você chegou até aqui, parabéns! Nesse ponto deveria estar tudo pronto, mas se for a promeira vez que você executa esse procedimento, sugiro os seguintes materiais:

- [verificando a saúde do compose linux](./compose-linux-healthcheck.md)
- [solucionando problemas do compose linux](./compose-linux-troubleshooting.md)
