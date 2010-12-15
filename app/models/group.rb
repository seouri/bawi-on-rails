class Group < ActiveRecord::Base
  has_many :boards
  belongs_to :owner, :class_name => "User"
end
