class HomeController < ApplicationController

	def welcome
		@projects = Project.all
	end
end
