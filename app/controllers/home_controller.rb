class HomeController < ApplicationController

  def welcome
    @gems_projects = Project.gems
    @ml_projects = Project.ml
    @android_projects = Project.android
    @web_projects = Project.web
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
    @project = Project.includes(:sections).find_by_title(params[:title])
    @previous_project = @project.previous
    @next_project = @project.next
  end

  def like
    if request.xhr?
      @project = Project.find_by_title(params[:title])
      @project.likes+=1
      @project.save!
      render json: { status: :ok, likes: @project.likes }.to_json
    end
  end
end
