FactoryBot.define do
	factory :project do
		sequence :id do |n| 
			n
		end 
		title 'Social Community Expansion'
		duration 'October 2017'
		role 'Analyst, Developer'
		tools 'Python, Gephi, LostCircles'
		tasks 'Analysis,Development'
		team 'individual'
		platform 'web'
		collaborators ''
		color "#2fc19b"
		image_url 'google.com'
		likes 10
		filter_types 'ML'
		order 1
	end
end