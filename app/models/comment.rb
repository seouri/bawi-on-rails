class Comment < ActiveRecord::Base
  belongs_to :article, :counter_cache => true
  belongs_to :owner, :class_name => "User"
end
