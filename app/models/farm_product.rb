class FarmProduct < ApplicationRecord
  belongs_to :user
  belongs_to :category

  has_many_attached :photos
  has_rich_text :description
end
