## README



* Ruby version:
$ ruby -v
ruby 2.2.2p95 (2015-04-13 revision 50295) [x86_64-darwin14]
* Bundler version:
$ bundler -v
Bundler version 1.10.5
* rails: gem install rails --pre

* Setup:
 $ git clone git@github.com:alexmorten/abicomment-api.git
 $ cd abicomment-api
 $ bundle
* Database
To setup a new development database with seed data(do only this to get the project running):
$ rake db:fresh
To reset the db to seed values:
$ rake db:reset
To migrate chagnes:
$ rake db:migrate
To delete the db :
$ rake db:drop
To create a new db:
$ rake db:create
To feed it seed data(look at db/seeds.rb):
$ rake db:seed
* To start the Api-server(--binding is to fix a strange issue I am expiriencing):
rails server --binding 127.0.0.1



* ...
