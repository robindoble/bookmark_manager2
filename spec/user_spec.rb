require 'user'

describe 'User' do 


	context 'adding a user to the DB' do 

		it 'should be created with an email and password' do 
			# expect(User.count).to be(0)
			User.create(:email => "robin@test.com", :password => "password123")
		end


	end




end