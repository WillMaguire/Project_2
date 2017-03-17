require 'sinatra'
# require 'sinatra/reloader'
# require 'pry'
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

  def checkbox_return(x)
    if x == "true"
      return true
    else
      return false
    end
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

get '/about' do
  erb :about
end

post '/client' do
  if Location.where(suburb: params[:aupair_search].upcase).exists?
      @results = Carer.where(suburb: params[:aupair_search])
      erb :show
    # do I need Location here at all?
  end
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
    session[:client_id] = client.id
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
  client.street_address = params[:street_address]
  if Location.where(suburb: params[:suburb].upcase).exists?
      client.suburb = params[:suburb]
    if Location.where(postcode: params[:postcode].to_i).exists?
      client.postcode = params[:postcode]
    end
  end
  client.img_url = params[:img_url]
  client.bio = params[:bio]
  client.host = checkbox_return(params[:host])
  client.children = params[:children]
  client.children_age_0to1 = checkbox_return(params[:children_age_0to1])
  client.children_age_2to3 = checkbox_return(params[:children_age_2to3])
  client.children_age_4to5 = checkbox_return(params[:children_age_4to5])
  client.children_age_6to8 = checkbox_return(params[:children_age_6to8])
  client.children_age_9to11 = checkbox_return(params[:children_age_9to11])
  client.children_age_12plus = checkbox_return(params[:children_age_12plus])
  client.save
   redirect '/client'
end

get '/signup/signup_carer' do
  erb :signup_carer
end

post '/signup/signup_carer' do
  if session[:client_id] || session[:carer_id] == true
    redirect '/'
    else
      carer = Carer.new
      carer.name = params[:name]
      carer.email = params[:email]
      carer.mobile_number = params[:mobile_number]
      carer.password = params[:password]
      carer.save
      session[:carer_id] = carer.id
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
  carer.street_address = params[:street_address]
  if Location.where(suburb: params[:suburb].upcase).exists?
    carer.suburb = params[:suburb]
    if Location.where(postcode: params[:postcode].to_i).exists?
      carer.postcode = params[:postcode]
    end
  end
  carer.img_url = params[:img_url]
  carer.age = params[:age]
  carer.bio = params[:bio]
  carer.blue_card = checkbox_return(params[:blue_card])
  carer.children_age_0to1 = checkbox_return(params[:children_age_0to1])
  carer.children_age_2to3 = checkbox_return(params[:children_age_2to3])
  carer.children_age_4to5 = checkbox_return(params[:children_age_4to5])
  carer.children_age_6to8 = checkbox_return(params[:children_age_6to8])
  carer.children_age_9to11 = checkbox_return(params[:children_age_9to11])
  carer.children_age_12plus = checkbox_return(params[:children_age_12plus])
  if carer.save

   redirect '/carer'

 end

end
