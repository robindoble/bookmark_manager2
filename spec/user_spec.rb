require 'spec_helper'
require 'user'


describe 'User' do 


	context 'adding a user to the DB' do 

		it 'should be created with an email and password' do 
			# expect(User.count).to be(0)
			user = User.create(:email => "robin@test.com", :password => "password123", :password_confirmation => "password123")
			expect(user.email).to eq("robin@test.com")
			puts user.inspect
			expect(User.count).to eq (1)
		end

		it 'sign up does not occur if passwords do not match' do 
			expect(User.count).to eq (0)
			user = User.create(:email => "robin@test.com", :password => "password123", :password_confirmation => "password456")
			expect(User.count).to eq (0)
		end

		it 'cant register the same user twice' do 
			expect(User.count).to eq (0)
			user = User.create(:email => "robin@test.com", :password => "password123", :password_confirmation => "password123")
			user2 = User.create(:email => "robin@test.com", :password => "password789", :password_confirmation => "password789")
			expect(User.count).to eq (1)
		end


	end




end