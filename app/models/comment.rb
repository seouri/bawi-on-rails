class Comment < ActiveRecord::Base
  belongs_to :article, :counter_cache => true
  belongs_to :owner, :class_name => "User"

  validates_uniqueness_of :comment_no, :scope => :board_id
end
