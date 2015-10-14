require 'sinatra'
require './models/siskel.rb'

get '/' do
	siskel = Siskel.new("Lion King")
	erb :'index.html', locals: {movie: siskel}
	
end