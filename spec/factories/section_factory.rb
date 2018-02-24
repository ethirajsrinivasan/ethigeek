FactoryBot.define do
	factory :section do
		sequence :id do |n| 
			n
		end 
		title 'Social Community Expansion'
		content 'October 2017'
		project_id 'Analyst, Developer'
		order 1
	end
end