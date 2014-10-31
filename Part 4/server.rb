require 'sinatra'

get "/" do  #high level on port 4567
	erb :index
end

get "/hi" do

	"Hi!!!"

end

get "/people/:name" do #wildcard method not symbol

	@name = params[:name].capitalize #make available to template make it @instance_variable

	erb :people

end
# get "/chris" do
# 	"Hi Chris"
# end

# get "/maria" do
# 	"Hi Maria!"
# end

# get "/Bruno" do
# 	"Hi Bruno"
# end
