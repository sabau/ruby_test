class NewsProduct < ActiveRecord::Base
  belongs_to :product
  belongs_to :news
end
