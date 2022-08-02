class FarmProduct < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_rich_text :description
  has_many_attached :photos
end
