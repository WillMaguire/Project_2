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
  @locations = Location.all
  erb :index
end

get '/session/new' do
  erb :login
end

get '/show' do

end

get '/client' do
  # return current_client.to_json
  erb :client
end


get '/carer' do
  erb :carer
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
    redirect '/client'
  else session[:carer_id] = user.id
    redirect '/carer'
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
    client = Client.new
    client.name = params[:name]
    client.email = params[:email]
    client.mobile_number = params[:mobile_number]
    client.password = params[:password]
    # client.password_digest #
    client.save
    redirect '/client'
end

get '/client_edit' do
  @client = current_client
  erb :client_edit
end

post '/client_edit' do
  client = current_client
  client.name = params[:name]
  client.email = params[:email]
  client.mobile_number = params[:mobile_number]
  if Location.where(suburb: params[:suburb].upcase).exists?
    client.suburb = params[:suburb]
  end
  binding.pry
  client.img_url = params[:img_url]
  client.bio = params[:bio]
  client.host = params[:host].to_i
  client.children = params[:children]
  client.children_age_0to1 = params[:children_age_0to1].to_i
  client.children_age_2to3 = params[:children_age_2to3].to_i
  client.children_age_4to5 = params[:children_age_4to5].to_i client.children_age_6to8 = params[:children_age_6to8].to_i
  client.children_age_9to11 = params[:children_age_9to11].to_i
  client.children_age_12plus = params[:children_age_12plus].to_i
  client.save
   redirect '/client'
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
      redirect '/carer'
    end
  end

get '/carer_edit' do
  @carer = current_carer
  erb :carer_edit
end

post '/carer_edit' do
  carer = current_carer
  carer.name = params[:name]
  carer.email = params[:email]
  carer.mobile_number = params[:mobile_number]
  if Location.where(suburb: params[:suburb].upcase).exists?
    carer.suburb = params[:suburb]
  end
  carer.img_url = params[:img_url]
  carer.bio = params[:bio]
  carer.blue_card = params[:blue_card].to_i
  carer.children_age_0to1 = params[:children_age_0to1].to_i
  carer.children_age_2to3 = params[:children_age_2to3].to_i
  carer.children_age_4to5 = params[:children_age_4to5].to_i carer.children_age_6to8 = params[:children_age_6to8].to_i
  carer.children_age_9to11 = params[:children_age_9to11].to_i
  carer.children_age_12plus = params[:children_age_12plus].to_i
  carer.save
   redirect '/carer'
end
