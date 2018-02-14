class Section < ApplicationRecord
  default_scope { order(order: :asc) }
  belongs_to :project
end
