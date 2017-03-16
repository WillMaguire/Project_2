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
    Client.find_by(id: session[:client_id])
  end

  def client_logged_in?
     !!current_client #double negative = positve
  end

  def current_carer
    Carer.find_by(id: session[:carer_id])
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
  @clients = Client.all
  @carers = Carer.all
  erb :index
end

get '/session/new' do
  erb :login
end

get '/show' do

end

get '/client' do
  erb :client
end


post '/show' do
  if
    client_logged_in?
    erb :client
  if carer_logged_in?
      erb :carer
    end
  end
end

delete '/session' do
  session[:client_id] = nil
  session[:carer_id] = nil
  redirect '/'
end

post '/session/new' do
  user = Client.find_by(email: params[:email])
  if (!user)
    user = Carer.find_by(email: params[:email])
  end
  if user && user.authenticate(params[:password])
    #create a session for you
    if user.class.to_s == "Client"
    session[:client_id] = user.id
  else session[:carer_id] = user.id
    redirect '/show'
  end

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
  if session[:client_id] || session[:carer_id]  == true
    redirect '/show'
    else
      client = Client.new
      client.name = params[:name]
      client.email = params[:email]
      client.mobile_number = params[:mobile_number]
      client.password = params[:password]
      # client.password_digest #
      client.save
      redirect '/show'
  end
end

get '/cliet_edit' do
  erb :cliet_edit
end

post 'client_edit' do
  
end

get '/signup/signup_carer' do
  erb :signup_carer
end

post '/signup/signup_carer' do
  if session[:client_id] || session[:carer_id] == true
    redirect '/show'
    else
      carer = Carer.new
      carer.name = params[:name]
      carer.email = params[:email]
      carer.mobile_number = params[:mobile_number]
      carer.password = params[:password]
      carer.save
      redirect '/show'
    end
  end

post '/client' do

end
