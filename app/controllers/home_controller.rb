class HomeController < ApplicationController
  def welcome
    @gems_projects = Project.gems
    @ml_projects = Project.ml
    @android_projects = Project.android
    @web_projects = Project.web
    @blogs = Blog.where(state:"published").first(3)
  end

  def resume
    link = "http://assets-ethi.appspot.com/files/resume.pdf"
    url = URI.parse(link)
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port) {|http|
      http.request(req)
    }
    send_data(res.body, :type => 'application/pdf', :disposition => 'inline')
  end

  def show
    @project = Project.includes(:sections).find_by_title(params[:title])
    @previous_project = @project.previous
    @next_project = @project.next
  end

  def like
    redirect_to :root unless request.xhr?
    @project = Project.find_by_title(params[:title])
    @project.likes += 1
    @project.save!
    render json: { status: :ok, likes: @project.likes }.to_json
  end
end
