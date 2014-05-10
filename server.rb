require 'sinatra/base'
require 'sinatra'
require 'data_mapper'
require 'rack-flash'

env = ENV["RACK_ENV"] || "development"
DataMapper.setup(:default, "postgres://localhost/bookmark_manager_#{env}")

require './lib/link'
require './lib/tag'
require	'./lib/user'

DataMapper.finalize
DataMapper.auto_upgrade!

class MyApp < Sinatra::Base

enable :sessions
set :session_secret, 'super-secret'

use Rack::Flash

	post '/' do 
		if params[:route] == "home"
			redirect to('/')
		else
			tag_array = params[:tags].split(",").map {|tag| Tag.first_or_create(:tag_name => tag)}
			puts tag_array.inspect
			Link.create(:title => params[:title],:url => params[:url],:tags => tag_array)
			redirect to('/')
		end
	end

	get '/tags/:text' do
		tag = Tag.first(:tag_name => params[:text])
		@links = (tag ? tag.links : [])
		erb :index
	end

	post '/users' do 
		@user = User.new(:email => params[:email], :password => params[:password], :password_confirmation => params[:password_confirmation])
		if @user.save 
			session[:user_id] = @user.id
			redirect to('/')
		else
			# flash[:notice] = "Sorry, your passwords do not match"
			flash.now[:errors] = @user.errors.full_messages
			erb :signup
		end
	end

	get '/' do 
		@links = Link.all
		@tags = Tag.all
		erb :index
	end

	get '/users/new' do 
		@user = User.new
		erb :signup
	end

	post '/sessions' do
	  email, password = params[:email], params[:password]
	  user = User.authenticate(email, password)
	  if user
	    session[:user_id] = user.id
	    redirect to('/')
	  else
	    flash[:errors] = ["The email or password is incorrect"]
	    erb :'sessions'
	  end
	end

	get '/sessions/new' do 
		# @user = User.new
		erb :sessions
	end


	helpers do 
		
		def current_user
			@current_user ||= User.get(session[:user_id]) if session[:user_id]
		end

	end

end




