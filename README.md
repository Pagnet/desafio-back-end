###### Ruby 2.5.8
###### Rails 5.2.4.4
###### SQLite
# Importador

### Configurando projeto
- Configure seu ambiente com as libs/gems se necessárias:  
  `$ curl -sL https://deb.nodesource.com/setup_12.x | bash - && \`  
  `curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \`  
  `echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list`  
  
  `$ apt-get update && apt-get install -qq -y --no-install-recommends \`  
  `nodejs yarn build-essential libpq-dev imagemagick git-all nano`  

- Instale bundler  
  `$ gem install bundler`  
  
- Usando rvm, instale a versão do ruby:  
  `rvm install 2.5.8`  

- Instale rails gem:  
  `$ gem install rails --version=5.2.4.4`  
  
- Execute os seguintes comandos:  
  `$ bundle install`  
  `$ rails db:create db:migrate`  
  
### Utilizando o importador
- Execute:  
  `$ rails s`  

- Acesse:  
  `http://localhost:3000`

### Testando
- Execute:  
  `$ bundle exec rspec`