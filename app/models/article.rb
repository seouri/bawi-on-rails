class Article < ActiveRecord::Base
  before_validation :set_numbers
  after_create :update_board
  belongs_to :board, :counter_cache => true
  has_many :comments
  belongs_to :author, :class_name => "User", :foreign_key => :user_id, :counter_cache => true

  validates_uniqueness_of :article_no, :scope => :board_id
  validates_presence_of :board, :user_id, :article_no, :parent_no, :thread_no, :title, :body
  validates_associated :board, :author
  validates_length_of :title, :in => 1..255
  validates_length_of :body, :minimum => 1

  attr_accessible :board_id, :title, :body

  private
  def set_numbers
    self.article_no = self.board.max_article_no + 1
    self.parent_no = self.article_no if self.parent_no.blank?
    self.thread_no = self.article_no if self.thread_no.blank?
  end

  def update_board
    Board.find(self.board_id).update_max_article_no
  end
end
