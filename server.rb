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
		title = params[:title]
		url = params[:url]
		tags = params[:tags]
		Link.create(:title => params[:title],:url => params[:url])
		
		redirect to('/')
	end

	get '/' do 
		@links = Link.all
		erb :index
	end


end