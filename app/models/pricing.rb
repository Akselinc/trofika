class Pricing < ApplicationRecord
  belongs_to :product
  enum pricing_type: [:standard, :bulk]
end
