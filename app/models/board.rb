class Board < ActiveRecord::Base
  belongs_to :group, :counter_cache => true
  has_many :articles
  belongs_to :owner, :class_name => "User", :counter_cache => true

  validates_presence_of :group, :user_id, :keyword
  validates_associated :group, :owner
  validates_uniqueness_of :keyword
  validates_length_of :keyword, :minimum => 1
  validates_format_of :keyword, :with => /^[-_a-z0-9]+$/

  has_friendly_id :keyword

  def update_max_article_no
    self.max_article_no = Article.maximum(:article_no, :conditions => "board_id = #{self.id}")
    self.save
  end
end
