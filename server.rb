require 'sinatra'
require './models/siskel.rb'

get '/' do
	siskel = Siskel.new("Scarface")
	# erb :'index.html'
	"This movie plot is #{siskel.plot}"
end