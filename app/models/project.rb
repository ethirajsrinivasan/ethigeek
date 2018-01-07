class Project < ApplicationRecord


  scope :gems, -> { where(filter_types: "gems") }
  scope :android, -> { where(filter_types: "android") }
  scope :web, -> { where(filter_types: "web") }
  scope :ml, -> { where(filter_types: "ML") }

  def next
    self.class.where("id > ?", id).first
  end

  def previous
    self.class.where("id < ?", id).last
  end
end
