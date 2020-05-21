# Como rodar a aplicação
>git clone <esse_projeto>
>cd desafio-back-end
>bundle install
>bundle exec rake db:create db:migrate
>yarn install
>rails s 


## Bando de dados
A configuração do banco está em config/database.yml
O banco de dados usado foi sqlite mas pode ser facilmente alterado mudando as configurações.

> rake db:create 

## Test
> bundle exec rspec -fd
