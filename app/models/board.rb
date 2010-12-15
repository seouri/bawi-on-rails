class Board < ActiveRecord::Base
  belongs_to :group, :counter_cache => true
  has_many :articles
  belongs_to :owner, :class_name => "User", :counter_cache => true
end
