require "sinatra"
require "sinatra/reloader"
require "typhoeus"
require "json"


get "/" do 

	erb :index
end


post "/result" do 
	@search_str = params[:movie]

	response = Typhoeus.get("http://www.omdbapi.com/", params: {s: @search_str})
	result = JSON.parse(response.body)

	if result["Search"].nil?
		erb :error
	else
		@movies = result["Search"].sort_by {|movie| movie["Year"] }.reverse

		@movies.each do |movie|
			response = Typhoeus.get("http://www.omdbapi.com/", params: {i: movie["imdbID"]})
			result = JSON.parse(response.body)

			movie["Poster"] = result["Poster"]
			movie["Plot"] = result["Plot"]
		end

		@movies.select! {|movie| movie["Type"]=='movie'}

		erb :result
	end
end


get '/poster/:imdb' do |imdb_id|
	response = Typhoeus.get("http://www.omdbapi.com/", params: {i: imdb_id}) 
	@movie = JSON.parse(response.body)

	erb :poster
end
