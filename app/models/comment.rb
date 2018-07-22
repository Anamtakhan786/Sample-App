class Comment < ApplicationRecord
  belongs_to :micropost
  validates :comment , presence: true , length: {maximum: 100}
end
