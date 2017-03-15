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

  def client_logged_in?
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

end

get '/carers' do

end

get  '/session/new' do
  erb :login
end


post '/session/new' do
  user = Client.find_by(email: params[:email])
  if (!user)
    user = Carer.find_by(email: params[:email])
  end
  if user && user.authenticate(params[:password])
    #create a session for you
    session[:user_id] = user.id
    redirect '/'
  else
    #get off my lawn! -- who are you?
    erb :login
  end
end

get '/signup' do
   erb :signup
end
