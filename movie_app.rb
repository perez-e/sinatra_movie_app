require "sinatra"
require "sinatra/reloader"
require "typhoeus"
require "json"


get "/" do 

	erb :index
end


post "/result" do 
	search_str = params[:movie]

	response = Typhoeus.get("http://www.omdbapi.com/", params: {s: search_str})
	result = JSON.parse(response.body)
end