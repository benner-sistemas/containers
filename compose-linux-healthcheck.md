# Verificando a saúde do compose linux

Garanta que os containers estão no ar:

``` bash
docker container ls --all
```

Verifique os logs ou inspecione determinado container:

``` bash
docker logs [containerID]
docker inspect [containerID]
```

## Portainer

Acesse sua url: `http://[host]:[porta]/`, a porta original é `9000` e a porta alternativa é `7200`. Na dúvida inspecione o container.

Sugestão para criação de usuário administrador: `admin/masterkey`

Pelo portainer você poderá verificar os containers que estão no ar, seus logs, suas portas entre outros detalhes, vale dar uma boa explorada se for sua primeira vez nestes territórios ;)

## Elastic

Acesse a url de healthcheck e interprete o json que irá retornar, em  `http://[host]:9200/_cat/health`.

## Kibana

Acesse a url do componente: `http://[host]:5601`

## Redis

Para confirmar a saúde do Redis a partir de um terminal windows:

``` bash
telnet [host] 6379
PING
```

A resposta deve ser `+PONG`, depois para sair basta `quit`

Para confirmar a saúde do Redis a partir de um terminal linux:

``` bash
echo PING | nc [host] 6379
```

A resposta deve ser `+PONG`

## RabbitMQ
Basta acessar a url da interface de administração em `http://[host]:15672/` por padrão as credencias são: `guest/guest`

## Keycloak

Basta acessar a url da interface de administração em `http://[host]:[porta]/`, a porta original é `8080` e a porta alternativa é `7600` por padrão as credenciais são: `admin/admin`

## PostgreSQL e Adminer

Acesse o Adminer em sua url: `http://[host]:[port]`, a porta original é `8080` e a porta alternativa é `7700`. Ao entrar, informe os campos abaixo:

``` bash
System=PostgreSQL
Server=tec-postgres-db
Username=postgres
Password=masterkey
Database=(deixe em branco)
```

Se o postgresql estiver saudável você deverá entrar com sucesso.

(ideia: seria legal automatizar essa verificação que garante que está tudo no ar)
