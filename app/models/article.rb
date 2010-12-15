class Article < ActiveRecord::Base
  belongs_to :board, :counter_cache => true
  has_many :comments
  belongs_to :owner, :class_name => "User", :counter_cache => true

  validates_uniqueness_of :article_no, :scope => :board_id
  validates_presence_of :board, :user_id, :article_no, :parent_no, :thread_no, :title, :body
  validates_associated :board, :owner
  validates_length_of :title, :in => 1..255
  validates_length_of :body, :minimum => 1
end
