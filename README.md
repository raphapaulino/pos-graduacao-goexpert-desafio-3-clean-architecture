# Desafio 3 - Clean Code (Pós Graduação GoExpert)

### DESCRIÇÃO DO DESAFIO

Olá devs!

**Objetivo:** Para este desafio, você precisará criar o use case de listagem das orders.

**Requisitos:**

Esta listagem precisa ser feita com:
- Endpoint REST (GET /order)
- Service ListOrders com GRPC
- Query ListOrders GraphQL

**Dicas:**

- Não esqueça de criar as migrações necessárias e o arquivo api.http com a request para criar e listar as orders.

- Para a criação do banco de dados, utilize o Docker (Dockerfile / docker-compose.yaml), com isso ao rodar o comando docker compose up tudo deverá subir, preparando o banco de dados.

- Inclua um `README.md` com os passos a serem executados no desafio e a porta em que a aplicação deverá responder em cada serviço.


### PRÉ-REQUISITOS

#### 1. Instalar o GO no sistema operacional:

É possível encontrar todas as instruções de como baixar e instalar o `GO` nos sistemas operacionais Windows, Mac ou Linux [aqui](https://go.dev/doc/install).


#### 2. Instalar o Git no sistema operacional:

É possível encontrar todas as instruções de como baixar e instalar o `Git` nos sistemas operacionais Windows, Mac ou Linux [aqui](https://www.git-scm.com/downloads).


#### 3. Instalar o Docker no sistema operacional:

É possível encontrar todas as instruções de como baixar e instalar o `Docker` nos sistemas operacionais Windows, Mac ou Linux [aqui](https://docs.docker.com/engine/install/).


#### 4. Instalar o programa 'migrate' no sistema operacional:

É possível encontrar todas as instruções de como baixar e instalar o `migrate` nos sistemas operacionais Windows, Mac ou Linux  [aqui](https://github.com/golang-migrate/migrate/tree/master/cmd/migrate).

Mais informações na [página inicial do repositório](https://github.com/golang-migrate/migrate).


#### 5. Clonar o repositório:

```
git clone git@github.com:raphapaulino/pos-graduacao-goexpert-desafio-3-clean-architecture.git
```

#### 6. Instalar o Evans no sistema operacional:

É possível encontrar todas as instruções de como baixar e instalar o `Evans` nos sistemas operacionais Windows, Mac ou Linux [aqui](https://github.com/ktr0731/evans?tab=readme-ov-file#installation).

Mais informações na [página inicial do repositório](https://github.com/ktr0731/evans).


#### 7. Conferir serviço MySQL

É **extremamente importante** para a correta execução desse projeto que não esteja com a porta padrão `3306` utilizada pelo `MySQL` em uso antes de iniciar as instruções abaixo.  

### EXECUTANDO O PROJETO

1. Estando na raiz do projeto, via terminal, execute o comando do Docker abaixo:

```
docker-compose up -d
```

2. Para executar as migrações que irão criar a tabela `orders` no banco de dados e inserir 2 pedidos nela:

```
migrate -path=sql/migrations -database="mysql://root:root@tcp(localhost:3306)/orders" -verbose up
```

3. À partir da raiz do projeto, via terminal, desça no diretório `ordersystem` conforme instruções abaixo e, logo em seguida, execute o comando posterior:

```
cd cmd/ordersystem/
```

```
go run main.go wire_gen.go
```

**Obs.:** O comando acima irá "subir" no endereço `http://localhost` os serviços:

- `Web` na porta `8000`
- `gRPC` na porta `50051`
- `GraphQL` na porta `8080`

4. Banco de dados e demais serviços preparados, utilize algum aplicativo como `Postman`, `Insomnia` ou mesmo a extensão `Rest Client` do `VSCode` para fazer as requisições via métodos POST e GET do protocolo HTTP nos endereços abaixo:

- Via POST, cria-se um novo pedido 

```
http://localhost:8080/createorder
```
![Requisição que cria um pedido](doc-images/20240602_211456.png "Cria um novo pedido")

- Via GET, lista todos pedidos
```
http://localhost:8080/order
```
![Requisição que lista pedidos](doc-images/20240602_211525.png "Lista todos pedidos")

**Obs.:** Na pasta api existem dois arquivos http `api/create_order.http` e `api/list_orders.http` que podem ser aproveitados para executar requisições com a extensão `Rest Client` do `VSCode`.

5. Após executar as migrações e a requisição do arquivo `api/create_order.http`, para verificar as informações direto no banco de dados MySQL, siga os passos a seguir:

5.1. Acesse o container docker do mysql da seguinte forma:

```
docker exec -it mysql bash
```

5.2. Acesse o banco de dados mysql dentro do container docker:

```
mysql -uroot -p orders
```

Assim que for solicitado a senha, informe `root`.

Então:

```
USE orders;
```

```
SELECT * FROM orders;
```

![Acesso ao banco MySQL pelo terminal](doc-images/20240602_211703.png "Tabela orders")


6. `Graphql`: Para acessar esse serviço, pelo navegador, abra o endereço abaixo:

```
http://localhost:8080
```

6.1. Em seguida, informe à esquerda o código completo da `query` da imagem abaixo, clique no botão de Play em destaque e então selecione a opção `listOrders`:

![Graphql no Browser](doc-images/20240602_211245.png "Query listOrders")


Por fim...

6. `gRPC`: Para acessar esse serviço, em um `novo terminal`, execute o comando abaixo na raiz do projeto:

```
evans -r repl
```

Obs.: Caso obtenha o erro abaixo assim que rodar o comando anterior, certifique-se de que o `passo 3` foi executado corretamente sem nenhum erro e todos os serviços estão ativos:

```
evans: failed to run REPL mode: failed to instantiate a new spec: failed to instantiate the spec: failed to list packages by gRPC reflection: failed to list services from reflection enabled gRPC server: rpc error: code = Unavailable desc = connection error: desc = "transport: Error while dialing dial tcp 127.0.0.1:50051: connect: connection refused"
```

6.1 Após acessar o gRPC utilizando o evans e executar os comandos `call ListOrders` e `call CreateOrder`, é preciso selecionar um pacote, um serviço e então as chamadas a serem executadas. Para isso siga para todas as etapas na sequência a seguir:

- 6.1.1 Digite `show` e dê um ESPAÇO, serão exibidas opções de comandos, com a tecla TAB selecione `package` e pressione ENTER;

- 6.1.2 Digite `package` e dê um ESPAÇO, serão exibidas opções de comandos, com a tecla TAB selecione `pb` e pressione ENTER;

- 6.1.3 Digite `show` e dê um ESPAÇO, serão exibidas opções de comandos, com a tecla TAB selecione `service` e pressione ENTER;

- 6.1.4 Digite `service` e dê um ESPAÇO, serão exibidas opções de comandos, com a tecla TAB selecione `OrderService` e pressione ENTER;

- 6.1.5 Para listar os pedidos: Digite `call` e dê um ESPAÇO, serão exibidas opções de comandos, com a tecla TAB selecione `ListOrders` e pressione ENTER;

Obs.: Caso obtenha o erro abaixo assim que rodar o comando anterior, certifique-se de que as credenciais de acesso banco de dados estão corretas :

```
command call: rpc error: code = Unknown desc = Error 1045 (28000): Access denied for user 'root'@'localhost' (using password: YES)
```

- 6.1.6 Para registrar um novo pedido: Digite `call` e dê um ESPAÇO, serão exibidas opções de comandos, com a tecla TAB selecione `CreateOrders` e pressione ENTER;

  - Informe uma string qualquer no campo `id` (ex.: `abcdef`) e pressione ENTER;
  - Informe uma valor inteiro ou com 2 casas decimais qualquer no campo `price` (ex.: `50`) e pressione ENTER ;
  - Informe uma valor inteiro ou com 2 casas decimais qualquer no campo `tax` (ex.: `10`) e pressione ENTER.

- 6.1.7 Liste os pedidos novamente: Digite `call` e dê um ESPAÇO, serão exibidas opções de comandos, com a tecla TAB selecione `ListOrders` e pressione ENTER;

- 6.1.8 Para finalizar, Digite `exit` e pressione ENTER para sair do evans.

![gRPC no Terminal](doc-images/20240604_095931.png "Print 1")

![gRPC no Terminal](doc-images/20240604_100018.png "Print 2")

![gRPC no Terminal](doc-images/20240604_100101.png "Print 3")


### EXTRA

Caso execute esse projeto via Linux, na raiz há um arquivo `Makefile` que pode ser utilizado para executar os comandos de migração do banco de dados da seguinte forma:

- Cria a tabela `orders` e a preenche com alguns registros de pedidos
```
make migrate
```

- Remove os registros de pedidos da tabela `orders` e a exclui
```
make migratedown
```

That's all folks! : )


## Contacts

[LinkedIn](https://www.linkedin.com/in/raphaelalvespaulino/)

[GitHub](https://github.com/raphapaulino/)

[My Portfolio](https://www.raphaelpaulino.com.br/)