require 'spec_helper'


describe Link do

	context 'demo of how datamapper works' do			
	
			it 'should be created and then retrieved from the DB' do 
			expect(Link.count).to eq(0)
			Link.create(:title => "Makers Academy", :url => "http://www.makersacademy.com/")
			expect(Link.count).to eq(1)
			link=Link.first
			expect(link.url).to eq("http://www.makersacademy.com/")
			expect(link.title).to eq("Makers Academy")
			link.destroy
			expect(Link.count).to eq(0)
			end
					
			it 'can have tags' do 
# 
			tag_strings = "codeschool","education"
			tag_array = tag_strings.to_a.map {|tag| Tag.first_or_create(:tag_name => tag)}
			link = Link.create(:title => "Makers Academy", :url => "http://www.makersacademy.com/", :tags => tag_array)
			# :text => lambda {|tag| tag.tag_name} 
			expect(link.tags.map{|tag| tag.tag_name}).to include "codeschool"
			expect(link.tags.map{|tag| tag.tag_name}).to include "education"
			end
	
	end
end



