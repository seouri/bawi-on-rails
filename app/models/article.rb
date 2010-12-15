class Article < ActiveRecord::Base
  belongs_to :board, :counter_cache => true
  has_many :comments
  belongs_to :owner, :class_name => "User", :counter_cache => true

  validates_uniqueness_of :article_no, :scope => :board_id
end
