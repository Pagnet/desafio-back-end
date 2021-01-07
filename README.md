# Desafio programação - para vaga Back-end

👋 Olá, Seja Bem-vindo(a) ao Desafio programação - para vaga Back-end.

# Exigências

**:warning: Atenção:** É necessário que os desenvolvedores usem o Docker no seu ambiente de desenvolvimento.

- **🛠 Modo Desenvolvimento Docker**
    - :computer: [Linux Ubuntu LTS](https://ubuntu.com/download/desktop)
    - 🐳 [Docker](https://docs.docker.com/engine/installation/) Deve estar instalado.
    - 🐳 [Docker Compose](https://docs.docker.com/compose/) Deve estar instalado.
    - **💡 Dica:** [Documentação do Docker](https://docs.docker.com/)

# Instalando

## 🐳 Modo Desenvolvimento com Docker


### Observações: 

- Porta 5432 deve estar liberada para o postgres, acaso não esteja liberada, no arquivo docker-compose.yml modifique a porta, exemplo: "5433:5432".

- Quando executar os comandos docker-compose [comando], porventura retorne erro de permissões, execute sudo docker-compose [comando] e adicione sua senha.

- Arquivos CNAB para testes na aplicação estão na pasta CNAB_files, nas raiz da projeto.

Após instalar o docker e docker-compose, estando na pasta raiz do projeto, execute:

```sh
docker-compose up web
```

Para se certificar que os seus containers subiram corretamente, todos os containers deve estar com o status `UP`, execute:

```sh
docker-compose ps -a
```

Para acessar o container da aplicação, execute:

```sh
docker-compose run --rm web bash
```

Para acessar a instância do banco de dados, execute:

```sh
docker exec-it [nome do db] bash
```

Para derrubar e subir a instância do docker novamente, execute:

```sh
docker-compose down && docker-compose up web
```

🚀 :clap: Para visualizar o sistema basta acessar no navegador no endereço: localhost:3000

# Seeds

### Necessário rodar as seeds, em um novo terminal execute:

```sh
docker-compose run --rm web bash
```

```sh
rake db:seed
```

# Como executar a Suíte de Teste

### Testes Unitários com Rspec, em um novo terminal execute:
```sh
docker-compose run --rm web bash
```

```sh
RAILS_ENV=test rails db:create
```

```sh
RAILS_ENV=test rails db:migrate
```

```sh
bundle exec rspec
```

# Jobs

### Necessário subir o servidor de jobs em outro terminal, pois o serviço que interpreta o arquivo é executado através de trends!

### Como subir o servidor em outro terminal, execute:

```sh
docker-compose run --rm web
```

```sh
rails jobs:work
```
### Para visualizar os jobs

Basta acessar no navegador no endereço: localhost:3000/delayed_job