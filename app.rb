require 'rubygems'
require 'sinatra'
require './config/database'
require './helpers/sinatra'

enable :sessions

get '/' do
  @u = session[:user]
  haml :index
end

get '/user/login' do
  haml :login
end

post '/user/login' do
  if session[:user] = User.authenticate(params["login"], params["password"])
    flash("Login successful")
    redirect '/'
  else
    flash("Login failed - Try again")
    redirect '/user/login'
  end
end

get '/user/logout' do
  session[:user] = nil
  flash("Logout successful")
  redirect '/'
end

get '/user/create' do
  haml :create
end

post '/user/create' do
  u = User.new
  u.login = params["login"]
  u.password = params["password"]
  u.email = params["email"]
  if u.save
    flash("User created")
    redirect '/user/list'
  else
    tmp = []
    u.errors.each do |e|
      tmp << (e.join("<br/>"))
    end
    flash(tmp)
    redirect '/user/create'
  end
end

get '/user/list' do
  @u = User.all
  haml :list
end
