require 'rails_helper'

RSpec.describe HomeController do

  let(:project) { create(:project) }

  describe "GET #welcome" do
    it "renders the welcome template" do
      get :welcome
      expect(response).to render_template("welcome")
    end
  end

  describe "GET #contact" do
    it "renders the contact template" do
      get :contact
      expect(response).to render_template("contact")
    end
  end

  describe "GET #about" do
    it "renders the welcome template" do
      get :about
      expect(response).to render_template("about")
    end
  end

  describe "GET #show" do
    it "renders the show template" do
      get :show, title: project.title
      expect(response).to render_template("show")
    end
  end

  describe "POST #like" do
    it "should increase the like count" do
      likes_count = project.likes
      xhr :post, :like, title: project.title
      project.reload
      expect(project.likes).to eq likes_count + 1
    end
  end

  describe "GET #resume" do
    it "should send the resume" do
      expect(@controller).to receive(:send_data) {@controller.render nothing: true}
      get :resume
    end
  end

end