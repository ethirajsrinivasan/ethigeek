require "rails_helper"

RSpec.describe Project, type: :model do
  subject { Project.new }

  describe "Validations" do
    it "should be valid with valid attributes" do
      subject.title = "Project 1"
      subject.duration = "September 2015"
      subject.filter_types = "ML"
      subject.order = 10
      expect(subject).to be_valid
    end

    it "should not be valid without title" do
      expect(subject).not_to be_valid
    end

    it "should not be valid without duration" do
      subject.title = "Project 1"
      expect(subject).not_to be_valid
    end

    it "should not be valid without filter_types" do
      subject.title = "Project 1"
      subject.duration = "September 2015"
      expect(subject).not_to be_valid
    end

    it "should not be valid without order" do
      subject.title = "Project 1"
      subject.duration = "September 2015"
      subject.filter_types = "ML"
      expect(subject).not_to be_valid
    end
  end

  describe "Associations" do
    it {should have_many(:sections) }
  end

  describe "methods" do

      let(:project1) { create(:project,order: 6) }
      let(:project2) { create(:project,order: 7) }

    it "should fetch the next project" do
      project2
      expect(project1.next).to eq project2
    end

    it "should fetch the previous project" do
      project1
      expect(project2.previous).to eq project1
    end
  end
end