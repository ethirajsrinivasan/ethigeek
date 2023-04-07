class HomeController < ApplicationController
  def welcome
    @gems_projects = Project.gems
    @ml_projects = Project.ml
    @android_projects = Project.android
    @web_projects = Project.web
    @blogs = Blog.published.first(3)
    render "welcome", layout: false
  end

  def show
    if valid_user?
      @project = Project.includes(:sections).find_by_title(params[:title])
    else
      @project = Project.active.includes(:sections).find_by_title(params[:title])
    end
    @previous_project = @project.previous
    @next_project = @project.next
    render "show", layout: "blog_application"
  end

  def like
    redirect_to :root unless request.xhr?
    @project = Project.find_by_title(params[:title])
    @project.likes += 1
    @project.save!
    render json: { status: :ok, likes: @project.likes }.to_json
  end

  def about
     render "about", layout: "blog_application"
  end

  def gadgets_and_accessories
    render "gadgets_and_accessories", layout: "blog_application"
  end
end
