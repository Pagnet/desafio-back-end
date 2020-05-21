# README

Como rodar a aplicação

> git clone <esse_projeto>
> cd desafio-back-end
> bundle install
> bundle exec rake db:create db:migrate
> yarn install
> rails s 

* Database creation
A configuração do banco está em config/database.yml

> rake db:create 

* Test
> bundle exec rspec -fd
