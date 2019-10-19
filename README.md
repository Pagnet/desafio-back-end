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

#### No docker
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
docker-compose up
```

___

# Tests

* Integração (capybara: usa o browser)
* Unitário (rspec)

Rodando tudo:
```
rspec 
```

Rodando todos exceto **:features** e **:pages**
```
rspec --exclude-pattern "spec/{features,pages}/**/*_spec.rb
```


#### No docker


Rodando todos:
```
docker-compose exec -e BROWSER_MODE=headless app rspec
```

Rodando somente testes unitários:
```
docker-compose exec app rspec --exclude-pattern "spec/{features,pages}/**/*_spec.rb"
```

Rodando somente testes de feature:
```
docker-compose exec -e BROWSER_MODE=headless app rspec spec/features
```
