class Article < ActiveRecord::Base
  before_validation :set_numbers
  after_create :update_board
  belongs_to :board, :counter_cache => true
  has_many :comments
  belongs_to :owner, :class_name => "User", :counter_cache => true

  validates_uniqueness_of :article_no, :scope => :board_id
  validates_presence_of :board, :user_id, :article_no, :parent_no, :thread_no, :title, :body
  validates_associated :board, :owner
  validates_length_of :title, :in => 1..255
  validates_length_of :body, :minimum => 1

  attr_accessible :title, :body
  private
  def set_numbers
    self.parent_no = self.article_no if self.parent_no.blank?
    self.thread_no = self.article_no if self.thread_no.blank?
  end

  def update_board
    Board.find(self.board_id).update_max_article_no
  end
end
