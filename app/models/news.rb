class News < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true
  validates :date, presence: true

  #has_many :product_news, :dependent => :destroy
  #has_many :products, :through => :product_news

  has_and_belongs_to_many :products
end
