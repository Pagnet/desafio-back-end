# Pagnet - CNAB

* [Link para a descrição do desafio](DESAFIO.md)

# Instalação

Pré requisitos:

* Ruby 2.6.3
* Rails 5.2
* Postgres 11

Se for executar fora do container, será necessário ajustar as configurações para o *Postgres* no arquivo `config/database.yml`

Primeiro, certifique-se que está no diretório do rails:
```
cd src
```

Setup inicial:
```
bin/setup
```

Inicie o app:
```
rails s -p 3000
```

# Docker
Crie as imagens:
```
docker-compose build
```

Setup inicial:
```
docker-compose run app bin/setup
```

Inicie o app:
```
docker-compose up app
```