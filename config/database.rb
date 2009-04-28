require 'rubygems'
require 'dm-core'
require 'models/User'

DataMapper.setup(:default, "sqlite3:///#{Dir.pwd}/test.db")