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

	@movies = result["Search"].sort_by {|movie| movie["Year"] }

	erb :result
end


get '/poster/:imdb' do |imdb_id|
	response = Typhoeus.get("http://www.omdbapi.com/", params: {i: imdb_id}) 
	@movie = JSON.parse(response.body)

	erb :poster
end
