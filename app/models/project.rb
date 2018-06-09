class Project < ApplicationRecord
  default_scope { order(order: :asc) }

  # scopes
  scope :active, -> { where(status: "published")}
  scope :gems, -> { active.where(filter_types: 'gems') }
  scope :android, -> { active.where(filter_types: 'android') }
  scope :web, -> { active.where(filter_types: 'web') }
  scope :ml, -> { active.where(filter_types: 'ML') }

  # validations
  validates :title, presence: true
  validates :duration, presence: true
  validates :filter_types, presence: true
  validates :order, presence: true

  # associations
  has_many :sections

  def next
    self.class.active.where('"projects"."order" > ?', order).first
  end

  def previous
    self.class.active.where('"projects"."order" < ?', order).last
  end
end
