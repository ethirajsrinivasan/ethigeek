require 'rails_helper'

RSpec.describe ProjectsController do

  before :each do
    Setting.project_page_enabled = true
  end

  let(:project) { create(:project) }
  let(:new_project) { build(:project) }
  
  describe "GET #index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET #show" do
    it "renders the show template" do
      get :show, id: project.id
      expect(response).to render_template("show")
    end
  end

  describe "GET #new" do
    it "renders the new template" do
      get :new
      expect(response).to render_template("new")
    end
  end

  describe "POST #create" do
    it "saves and redirects to show" do
      project_count = Project.all.count
      post :create, params: { project: new_project.attributes }
      expect(Project.all.count).to eq project_count + 1
      expect(response).to redirect_to project_path(assigns[:project])
    end

    it "redirect to new if project is invalid" do
      attributes = new_project.attributes
      attributes["title"] = ''
      post :create, params: { project: attributes }
      expect(response).to render_template "new"
    end
  end

  describe "PATCH #update" do
    it "should update project and redirects to show" do
      project_modified = project
      project_modified.title = "xyz"
      put :update, params: {id: project_modified.id, project: project_modified.attributes }
      expect(Project.last.title).to eq "xyz"
    end

    it "redirect to edit if project is invalid" do
      attributes = project.attributes
      attributes["title"] = ''
      post :update, params: { id: project.id, project: attributes }
      expect(response).to render_template "edit"
    end
  end

  describe "DELETE destroy" do
    it "should delete the project" do
      project
      project_count = Project.all.count
      delete :destroy, id: project.id
      expect(Project.all.count).to eq project_count - 1
    end
  end
end