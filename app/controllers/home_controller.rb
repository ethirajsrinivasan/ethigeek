class HomeController < ApplicationController

  def welcome
    @projects = Project.all
  end

  def portfolio
    @projects = Project.all
  end

  def contact
  end

  def resume
    data = open("https://assets-ethi.appspot.com/files/resume.pdf")
    send_data(data.read, :type => 'application/pdf', :disposition => 'inline')
  end

  def about
  end

  def show
    @project = Project.find_by_title(params[:title])
  end
end
