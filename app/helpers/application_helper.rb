module ApplicationHelper
	def header_image
		if params[:controller] == "blogs" && params[:action] == "index"
			"blogs.jpg"
		elsif params[:controller] == "home" 
			case params[:action]
			when "about"
				"about.jpg"
			when "contact"
				"contact.jpg"
			when "welcome"
				"welcome.jpg"
			else
				"welcome.jpg"
			end
		else
			"welcome.jpg"
		end
	end

	def header_height
		if params[:controller] == "home" && params[:action] == "welcome"
			"51rem"
		else
			"30rem"
		end
	end
end
