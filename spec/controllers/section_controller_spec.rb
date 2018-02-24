require 'rails_helper'

RSpec.describe SectionsController do

  before :each do
    Setting.project_page_enabled = true
  end

  let(:section) { create(:section) }
  let(:new_section) { build(:section) }
  
  describe "GET #index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET #show" do
    it "renders the show template" do
      get :show, id: section.id
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
      section_count = Section.all.count
      post :create, params: { section: new_section.attributes }
      expect(Section.all.count).to eq section_count + 1
      expect(response).to redirect_to new_section_path
    end

    it "redirect to new if section is invalid" do
      attributes = new_section.attributes
      attributes["title"] = ''
      post :create, params: { section: attributes }
      expect(response).to render_template "new"
    end
  end

  describe "PATCH #update" do
    it "should update section and redirects to show" do
      section_modified = section
      section_modified.title = "xyz"
      put :update, params: {id: section_modified.id, section: section_modified.attributes }
      expect(Section.last.title).to eq "xyz"
    end

    it "redirect to edit if section is invalid" do
      attributes = section.attributes
      attributes["title"] = ''
      post :update, params: { id: section.id, section: attributes }
      expect(response).to render_template "edit"
    end
  end

  describe "DELETE destroy" do
    it "should delete the section" do
      section
      section_count = Section.all.count
      delete :destroy, id: section.id
      expect(Section.all.count).to eq section_count - 1
    end
  end
end