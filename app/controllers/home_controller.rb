class HomeController < ApplicationController

	def welcome
		@projects = Project.all
	end

	def portfolio
		@projects = Project.all
	end

	def contact
	end

	def about
	end
end
