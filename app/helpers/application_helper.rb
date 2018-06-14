module ApplicationHelper
	def header_image
		if params[:controller] == "blogs" && params[:action] == "index"
			image_path("blogs.jpg")
		elsif params[:controller] == "blogs" && params[:action] == "show"
			@blog.picture
		else
			image_path("welcome.jpg")
		end
	end

	def header_height
		if params[:controller] == "home" && params[:action] == "welcome"
			"51rem"
		else
			"30rem"
		end
	end

	def valid_user?
  		user_signed_in? && current_user.email ="ethirajsrinivasan@gmail.com"
  	end
end
