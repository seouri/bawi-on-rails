class Group < ActiveRecord::Base
  has_many :boards
  belongs_to :owner, :class_name => "User", :counter_cache => true

  validates_presence_of :user_id
  validates_associated :owner
  validates_uniqueness_of :keyword
  validates_presence_of :keyword
  validates_length_of :keyword, :minimum => 1
  validates_format_of :keyword, :with => /^[-_a-z0-9]+$/

  has_friendly_id :keyword
end
