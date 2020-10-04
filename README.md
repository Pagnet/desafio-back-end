# Processador de Arquivos CNAB

Este aplicativo web tem por função registrar transações financeiras a partir do processamento de arquivos ``.txt`` com conteúdo formatado de acordo com o padrão CNAB. As informações são exibidas para cada empresa registrada no banco de dados. Para utilizar tais funções, o usuário precisa se cadastrar no aplicativo de forma tradicional ou usando sua conta Google.

## Requisitos Mínimos
- Ruby 2.7.1
- Rails 6.0.3
- Bundler
- Git

## Instalação
1 - Baixar este repositório. Pode-se fazer um fork dele, mas não é necessário.

1.1 - Uma opção simples, em ambiente UNIX, é acessar através do terminal a pasta em que se quer guardar o repositório e rodar o seguinte comando:

```
git clone git@github.com:luis-novoa/desafio-back-end.git
```

2 - Ainda no terminal, acesse o repositório recém baixado e instale todas as gems com o comando ``bundle install``.

3 - Baixe o arquivo ``master.key`` que foi recebido em seu email e adicione-o à pasta ``config`` do projeto.

4 - Inicie a base de dados com ``rails db:migrate``.

5 - Sua cópia do projeto agora está pronta para iniciar o servidor. Faça isso executando ``rails server``.

6 - Acesse ``http://0.0.0.0.xip.io:3000/`` para utilizar o aplicativo web. Observação: o domínio ``.xip.io`` é imprescindível para que o sistema OAuth 2.0 funcione.

## Testes
Este projeto foi desenvolvido seguindo a metodologia TDD com o auxílio da gem RSpec. 20 testes foram criados para assegurar o bom funcionamento do aplicativo. Confira-os executando o seguinte comando:

```
rspec --format documentation
```

## Autor

👤 **Luis Novoa**

- GitHub: [luis-novoa](https://github.com/luis-novoa)
- Twitter: [@LuisMatteNovoa](https://twitter.com/LuisMatteNovoa)
- Linkedin: [Luis Novoa](https://www.linkedin.com/in/luismattenovoa/)