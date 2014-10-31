require 'sinatra'
require './rolodex'
require 'data_mapper'

DataMapper.setup(:default, "sqlite3:database.sqlite3")

class Contact

  include DataMapper::Resource

  property :id, Serial
  property :first_name, String
  property :last_name, String
  property :email, String
  property :note, String

end

DataMapper.finalize
DataMapper.auto_upgrade!


$rolodex = Rolodex.new
# $rolodex.add_contact(Contact.new("Johnny", "Bravo", "johnny@bitmakerlabs.com", "Rockstar"))

# $rolodex = Rolodex.new


get '/' do 

	@crm_app_name = "Steinunn's CRM"

	erb :index, :layout => :layout 
	
end

get '/contacts' do

	@contacts = Contact.all
	erb :contact
end

get '/contacts/new' do

	erb :new_contact

end

post '/contacts' do

	contact = Contact.create(
    :first_name => params[:first_name],
    :last_name => params[:last_name],
    :email => params[:email],
    :note => params[:note]
  )
 	redirect to ('/contacts')
end

get "/contacts/:id" do
  @contact = Contact.find(params[:id].to_i)
  if @contact
    erb :show_contact
  else
    raise Sinatra::NotFound
  end
end

end

get "/contacts/:id/edit" do
  @contact = $rolodex.find(params[:id].to_i)
  if @contact
    erb :edit_contact
  else
    raise Sinatra::NotFound
  end
end

put "/contacts/:id" do
  @contact = $rolodex.find(params[:id].to_i)
  if @contact
    @contact.first_name = params[:first_name]
    @contact.last_name = params[:last_name]
    @contact.email = params[:email]
    @contact.note = params[:note]

    redirect to("/contacts")
  else
    raise Sinatra::NotFound
  end
end

delete "/contacts/:id" do
  @contact = $rolodex.find(params[:id].to_i)
  if @contact
    $rolodex.remove_contact(@contact)
    redirect to("/contacts")
  else
    raise Sinatra::NotFound
  end
end

