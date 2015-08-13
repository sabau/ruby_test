class News < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true
  validates :data, presence: true
end
