class Section < ApplicationRecord
  default_scope { order(order: :asc) }

  #Association
  belongs_to :project

  #vaidations
  validates :order, presence: true
  validates :title, presence: true
  validates :content, presence: true
  validates :project_id, presence: true
end
