class CreateBoards < ActiveRecord::Migration
  def self.up
    create_table :boards do |t|
      t.integer :group_id
      t.string :name
      t.integer :max_article_no, :default => 0
      t.integer :max_comment_no, :default => 0
      t.integer :articles_count, :default => 0

      t.timestamps
    end
    add_index :boards, :group_id
  end

  def self.down
    drop_table :boards
  end
end