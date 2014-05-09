require 'sinatra/base'
require 'data_mapper'


env = ENV["RACK_ENV"] || "development"
DataMapper.setup(:default, "postgres://localhost/bookmark_manager_#{env}")

require './lib/link'
require './lib/tag'


DataMapper.finalize
DataMapper.auto_upgrade!


class MyApp < Sinatra::Base

	post '/' do 
		tag_array = params[:tags].split(" ").map {|tag| Tag.first_or_create(:tag_name => tag)}
		puts tag_array.inspect
		Link.create(:title => params[:title],:url => params[:url],:tags => tag_array)
		redirect to('/')
	end

	get '/' do 
		@links = Link.all
		@tags = Tag.all
		erb :index
	end


end