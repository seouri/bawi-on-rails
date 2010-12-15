class Article < ActiveRecord::Base
  belongs_to :board, :counter_cache => true
  has_many :comments
  belongs_to :owner, :class_name => "User"
end
