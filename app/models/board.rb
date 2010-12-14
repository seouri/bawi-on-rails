class Board < ActiveRecord::Base
  belongs_to :group, :counter_cache => true
  has_many :articles
end
