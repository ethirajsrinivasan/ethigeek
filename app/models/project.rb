class Project < ApplicationRecord
  default_scope { order(order: :asc) }

  scope :gems, -> { where(filter_types: "gems") }
  scope :android, -> { where(filter_types: "android") }
  scope :web, -> { where(filter_types: "web") }
  scope :ml, -> { where(filter_types: "ML") }

  def next
    self.class.where('"projects"."order" > ?', order).first
  end

  def previous
    self.class.where('"projects"."order" < ?', order).last
  end
end
