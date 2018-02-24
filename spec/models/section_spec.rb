require 'rails_helper'

RSpec.describe Section, type: :model do
  subject { Section.new}

  describe "Validations" do
    it "is valid with valid attributes" do
      subject.order = 1
      subject.title = "My project"
      subject.content = "<div>Hi</div>"
      subject.project_id = 1
      expect(subject).to be_valid
    end

    it "is not valid without order" do
      expect(subject).not_to be_valid
    end

    it "is not valid without title" do
      subject.order = 1
      expect(subject).not_to be_valid
    end

    it "is not valid without content" do
      subject.order = 1
      subject.title = "My project"
      expect(subject).not_to be_valid
    end

    it "is not valid without project_id" do
      subject.order = 1
      subject.title = "My project"
      subject.content = "<div>Hi</div>"
      expect(subject).not_to be_valid
    end
  end

  describe "Associations" do
    it {should belong_to(:project)}
  end

end