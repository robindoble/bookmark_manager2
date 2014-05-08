require 'spec_helper'

describe Tag do 

	context 'a demo of how tags work' do  

		it 'should be created and then retrieved from the DB' do 
			expect(Tag.count).to eq(0)
			Tag.create(:tags => "education")
			expect(Tag.count).to eq(1)
			tag=Tag.first
			expect(tag.tags).to eq("education")
			tag.destroy
			expect(Tag.count).to eq(0)
		end


	end

end