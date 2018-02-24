class Project < ApplicationRecord
  default_scope { order(order: :asc) }

  #scopes
  scope :gems, -> { where(filter_types: "gems") }
  scope :android, -> { where(filter_types: "android") }
  scope :web, -> { where(filter_types: "web") }
  scope :ml, -> { where(filter_types: "ML") }

  #Validations
  validates :title, presence: true
  validates :duration, presence: true
  validates :filter_types, presence: true
  validates :order, presence: true

  #Associations
  has_many :sections

  def next
    self.class.where('"projects"."order" > ?', order).first
  end

  def previous
    self.class.where('"projects"."order" < ?', order).last
  end
end

