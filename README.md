# Desafio 3 - Clean Code (Pós Graduação GoExpert)

## OBS.: Estou terminando de atualizar a documentação localmente, logo subo aqui no repositório.

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

#### 6. Conferir serviço MySQL

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

3. Estando na raiz do projeto, via terminal, execute o comando abaixo:

```
go run main.go wire_gen.go
```

**Obs.:** Esse comando irá "subir" no endereço `http://localhost` os serviços:

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

**Obs.:** Na pasta api existem dois arquivos http para fazer as chamadas `api/create_order.http` e `api/list_orders.http` que podem ser aproveitados para executar requisições com a extensão `Rest Client` do `VSCode`.


5. Após executar as migrações e a requisição do arquivo `api/create_order.http`, para verificar as informações direto no banco de dados MySQL, siga os passos a seguir:

5.1. Acesse o container docker do mysql

```
docker exec -it mysql bash
```

5.2. Acesse o banco de dados mysql dentro do container docker

```
mysql -uroot -p courses
```

Assim que for solicitado a senha, informe `root`.

Então:

```
USE courses;
```

```
SELECT * FROM courses;
```

![Acesso ao banco MySQL pelo terminal](doc-images/20240602_211703.png "Tabela orders")


6. `Graphql`: Para acessar esse serviço, pelo navegador, abra o endereço abaixo:

```
http://localhost:8080
```

6.1. Em seguida, informe à esquerda o código completo da `query` da imagem abaixo e então clique no botão de Play em destaque:

![Graphql no Browser](doc-images/20240602_211245.png "Query listOrders")


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