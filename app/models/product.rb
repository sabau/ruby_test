class Product < ActiveRecord::Base
  validates :title, presence: true
  validates :category_id, presence: true

  belongs_to :category
  #may be useful in not standard relationships
  #has_many :news_products, :dependent => :destroy
  #has_many :news, :through => :news_products
  has_and_belongs_to_many :news
end
