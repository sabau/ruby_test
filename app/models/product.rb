class Product < ActiveRecord::Base
  validates :title, presence: true
  validates :category_id, presence: true

  belongs_to :category

end
