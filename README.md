# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
	2.7.1
* System dependencies
	redis

* Configuration

* Database creation
	criar variaveis de ambiente para url do banco
	DATABASE_URL

* Database initialization

* How to run the test suite
	testes em rspec

* Services (job queues, cache servers, search engines, etc.)
	sidekiq
	memcache


* Deployment instructions
rode o seed para setup inicial do projeto:
bundle exec rake db:seed

* ...
