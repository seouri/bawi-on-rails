class Group < ActiveRecord::Base
  has_many :boards
  belongs_to :owner, :class_name => "User", :foreign_key => :user_id, :counter_cache => true
  belongs_to :parent, :class_name => "Group", :foreign_key => :parent_id, :counter_cache => :children_count
  has_many :children, :class_name => "Group", :foreign_key => :parent_id, :order => "name"

  validates_presence_of :user_id
  validates_associated :owner
  validates_uniqueness_of :keyword
  validates_presence_of :keyword
  validates_length_of :keyword, :minimum => 1
  validates_format_of :keyword, :with => /^[-_a-z0-9]+$/

  has_friendly_id :keyword

  scope :root, where(:parent_id => nil).order("name")

  def ancestors
    ancestor = []
    ancestor.push(self.parent, self.parent.ancestors) unless self.parent.nil?
    ancestor.reverse.flatten
  end
end
