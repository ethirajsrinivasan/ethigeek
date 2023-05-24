module ApplicationHelper
	def header_image
		if params[:controller] == "blogs" && params[:action] == "index"
			image_url("blogs.jpg")
		elsif params[:controller] == "blogs" && params[:action] == "show"
			@blog.picture
		elsif params[:controller] == "home" && params[:action] == "about"
			image_url("mbs.avif")
		elsif params[:controller] == "home" && params[:action] == "gadgets_and_accessories"
			image_url("gadgets.avif")
		else
			image_url("ai.jpg")
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
