class Comment < ActiveRecord::Base
  before_validation :set_numbers
  after_create :update_board
  after_destroy :update_board

  belongs_to :board, :counter_cache => true
  belongs_to :article, :counter_cache => true
  belongs_to :author, :class_name => "User", :foreign_key => :user_id, :counter_cache => true

  validates_uniqueness_of :comment_no, :scope => :board_id
  validates_presence_of :board, :article, :user_id, :comment_no, :body
  validates_associated :board, :article, :author
  validates_length_of :body, :minimum => 1

  private
  def set_numbers
    self.comment_no = self.board.max_comment_no + 1
  end

  def update_board
    Board.find(self.board_id).update_max_comment_no
  end
end
