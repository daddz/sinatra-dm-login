require 'rubygems'
require 'sinatra'
require 'dm-core'
require 'dm-migrations'

namespace :db do
  require './config/database'

  desc "Migrate the database"
  task :migrate do
    DataMapper.auto_migrate!
  end
  
  desc "Add some test users"
  task :testusers do
    us = User.new
    us.login = "test"
    us.email = "asdf@asdf.de"
    us.password = "pw"
    us.save

    as = User.new
    as.login = "foo"
    as.email = "yes@asd.de"
    as.password = "bar"
    as.save
  end    
end
    
