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
- [pgadmin](https://hub.docker.com/r/dpage/pgadmin4) - utilizado como interface para gerenciar o postgresql
- [mongo](https://www.mongodb.com/) - utilizado como repositório noSQL em nossa arquitetura
- [mongo-express](https://hub.docker.com/_/mongo-express) - utilizado como interface para gerenciar o mongo
- [fluentd](https://www.fluentd.org/) - utilizado como agent intermediário para receber logs estruturados e enviar para vários destinos conforme [configuração](./fluent.conf)

### Executando o compose linux

Entre no terminal linux, geralmente pelo comando `ssh root@[hostname]`, então vá até o diretório raiz, geralmente pelo comando `cd /`.

Faça o `clone` deste repositório:

``` bash
git clone --progress -v "https://github.com/benner-sistemas/containers.git"
```

Provavelmente você precisará de um usuário e senha para clonar este repositório. Caso suas credenciais do domínio benner não tenham permissão, acione alguém da Tecnologia para liberar o acesso ao repositório.

Após clonar o repositório, entre no diretório, com o comando `cd containers`.

Monte uma nova imagem do FluentD conforme suas necessidades de configuração, ou seja, altere o arquivo [fluent.conf](./fluent.conf) antes de seguir adiante. Quando estiver pronto, execute:

``` bash
docker build -t fluentd-custom -f dockerfile.fluentd .
```

Agora basta executar o compose linux, através do seguinte comando:

``` bash
docker-compose -f docker-compose-linux.yml up -d
```

Se você chegou até aqui, parabéns! Nesse ponto deveria estar tudo pronto, mas se for a primeira vez que você executa esse procedimento, sugiro os seguintes materiais:

- [verificando a saúde do compose linux](./compose-linux-healthcheck.md)
- [solucionando problemas do compose linux](./compose-linux-troubleshooting.md)

Importante também garantir a existência de databases e collections no mongo conforme sua necessidade.

## docker-compose-windows.yml

Este [arquivo](./docker-compose-windows.yml) armazena alguns componentes Benner da nossa arquitetura:

- [bserver](https://hub.docker.com/r/bennersistemas/bserver) - Esta é uma imagem construída e liberada pela Tecnologia Benner contendo o Benner Server
- [btl](https://hub.docker.com/r/bennersistemas/btl) - Esta é uma imagem construída e liberada pela Tecnologia Benner contendo o Worker do BTL (Business Tasks Library)
- [wfl](https://hub.docker.com/r/bennersistemas/wfl) - Esta é uma imagem construída e liberada pela Tecnologia Benner contendo o Workflow
- [wes](https://hub.docker.com/r/bennersistemas/wes) - Esta é uma imagem construída e liberada pela Tecnologia Benner contendo o WES (Web Enterprise Suite)

### Executando o compose windows

Entre no terminal windows, então vá até o diretório raiz, geralmente pelo comando `cd /`.

Faça o `clone` deste repositório:

``` bash
git clone --progress -v "https://github.com/benner-sistemas/containers.git"
```

Após clonar o repositório, entre no diretório, com o comando `cd containers`.

Edite o arquivo `benner.env` para informar todos os parâmetros dos componentes Benner.

Devido à um bug no docker-compose para windows, você precisará explicitamente carregar o benner.env para que o compose consiga recuperar os parâmetros. Para facilitar criamos um script powershell onde você pode opcionalmente informar qualquer arquivo .env:

```` bash
.\load-benner-env.ps1 .\benner.env
````

Você ainda pode organizar vários arquivos de parametrização. Por exemplo:

- `desenv.env`
- `qa.env`
- `homolog.env`
- `prod.env`

Agora basta executar o compose windows, através do seguinte comando:

``` bash
docker-compose -f docker-compose-windows.yml up -d
```

Opcionalmente você pode carregar o arquivo .env e disparar o compose em uma linha de instrução, separando por `;` veja:

``` bash
.\load-benner-env.ps1 .\benner.env; docker-compose -f docker-compose-windows.yml up -d
```

Opcionalmente você pode editar diretamente o arquivo `docker-compose-windows.yml` e informar os parâmetros para cada um dos containers nele.
