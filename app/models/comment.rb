class Comment < ActiveRecord::Base
  belongs_to :board, :counter_cache => true
  belongs_to :article, :counter_cache => true
  belongs_to :owner, :class_name => "User", :counter_cache => true

  validates_uniqueness_of :comment_no, :scope => :board_id
  validates_presence_of :board, :article, :user_id, :comment_no, :body
  validates_associated :board, :article, :owner
  validates_length_of :body, :minimum => 1
end
