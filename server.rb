require 'sinatra/base'
require 'data_mapper'


env = ENV["RACK_ENV"] || "development"
DataMapper.setup(:default, "postgres://localhost/bookmark_manager_#{env}")

require './lib/link'

DataMapper.finalize
DataMapper.auto_upgrade!


class MyApp < Sinatra::Base

	get '/' do 
		erb :index
		# "Bookmark Manager"
	end


end