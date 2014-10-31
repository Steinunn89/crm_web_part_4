require 'sinatra'
require 'data_mapper'

DataMapper.setup(:default, "sqlite3:database.sqlite3")

@@libary

class Film

	include DataMapper::Resource

	#Serial increments, DB handles it

	property :id, Serial
	property :title, String
	property :director, String
	property :year, Integer
	property :country, String
	property :genre, String
	property :rating, Integer
	property :description, String


	# all this can be done by ^^


	# attr_accessor :id, :title, :director, :year, :country, :genre, :rating, :description

	#  # make it accept hash so can pass through many items but don't always need or know all the info

	# def initialize (options)            
	# 	@title = options[:title]
	# 	@director = options[:director]
	# 	@year = options[:year]
	# 	@country = options[:country]
	# 	@genre = options[:genre]
	# 	@rating = options[:rating]
	# 	@description = options[:description]

	# end
	#Film.new[:director => "steve speilberg", :genre => "action"] 
end

DataMapper.finalize
DataMapper.auto_upgrade!


get "/" do

	# requires index.erb

	erb :index


end

get "/films/new" do

	erb :new
end

get "/films" do

	erb :index
end

get "/films" do
	@films=Film.get() #incomplete check class's .rb
	erb :new
end

post "/films" do
	puts
	puts params
	puts
	Film.create(params)
	redirect to "/films"
end

get "/signup" do

	#check this input
	erb: sign_up


end

	