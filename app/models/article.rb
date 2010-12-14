class Article < ActiveRecord::Base
  belongs_to :board, :counter_cache => true
  has_many :comments
end
