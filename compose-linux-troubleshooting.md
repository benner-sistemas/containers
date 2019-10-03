# Solucionando problemas do compose linux

Garanta que os containers estão no ar:

``` bash
docker container ls --all
```

Verifique os logs ou inspecione determinado container:

``` bash
docker logs [containerID]
docker inspect [containerID]
```

## Erro no elasticsearch mencionando `vm.max_map_count`

É possível que ocorra erro no Elastic, mencionando `vm.max_map_count`, nesse caso aplicar o fix abaixo, ou ler [esse material](https://www.elastic.co/guide/en/elasticsearch/reference/6.3/docker.html)

``` bash
# To apply the setting on a live system type:
sysctl -w vm.max_map_count=262144
```

## Portas

Talvez seja necessário alterar alguma porta que já esteja em uso..

Para listar o processo utilizando determinada porta:

``` bash
netstat -ltnp | grep -w ':8443'
```

Ao aterar portas no .yml, lembrar: `host-port:container-port`, mais detalhes interessantes [nesse documento](https://docs.docker.com/config/containers/container-networking/)

## Outros casos

Aqui estão listados alguns comandos básicos que talvez você precise ao lidar com containers... No geral é isso e google 🤷‍

Para atualizar repositório: `git pull`

Para executar compose linux exibindo os logs, basta remover o `-d` do final:

``` bash
docker-compose -f docker-compose-linux.yml up
```

Para executar compose linux sem bloquear o terminal, passar `-d` no fim do comando:

``` bash
docker-compose -f docker-compose-linux.yml up -d
```

Para parar a execução do compose linux, utilize o comnaod `down`:

``` bash
docker-compose -f docker-compose-linux.yml down
```
