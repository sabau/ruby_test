class Feature < ActiveRecord::Base
  validates :name, presence: true
  validates :description, presence: true
  validates :product_id, presence: true

  belongs_to :product
end
