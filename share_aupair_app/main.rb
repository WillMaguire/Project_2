require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'pg'
require_relative 'database_config'
require_relative 'models/carer'
require_relative 'models/client'
require_relative 'models/location'

enable :sessions

helpers do

  def current_client
    Client.find_by(id: session[:user_id])
  end

  def client_logged_in?
     !!current_client #double negative = positve
  end

  def current_carer
    Carer.find_by(id: session[:user_id])
  end

  def carer_logged_in?
     !!current_carer #double negative = positve
  end

end

def run_sql(sql)
  conn = PG.connect(dbname: 'share_aupair')
  result = conn.exec(sql)
  conn.close
  return result
end

get '/' do
  erb :index
end

get '/clients' do
  erb :client
end

get '/carers' do
  erb :carer
end

get  '/session/new' do
  erb :login
end

get '/show' do
  erb :shows
end

post '/session/new' do
  user = Client.find_by(email: params[:email])
  if (!user)
    user = Carer.find_by(email: params[:email])
  end
  if user && user.authenticate(params[:password])
    #create a session for you
    session[:user_id] = user.id
    redirect '/show'
  else
    #get off my lawn! -- who are you?
    erb :login
  end
end

get '/signup' do
   erb :signup
end

get '/signup/signup_client' do
  erb :signup_client
end

post '/signup/signup_client' do
  client = Client.new
  client.name = params[:name]
  client.email = params[:email]
  client.mobile_number = params[:mobile_number]
  client.password = nil
  client.password_digest # => nil
  client.password = params[:password]
  client.password_digest #
  client.save
end

get '/signup/signup_carer' do
  erb :signup_carer
end

post '/signup/signup_carer' do
  carer = Carer.new
  carer.name = params[:name]
  carer.email = params[:email]
  carer.mobile_number = params[:mobile_number]
  carer.password = nil
  carer.password_digest # => nil
  carer.password = params[:password]
  carer.password_digest
  carer.save 
end
