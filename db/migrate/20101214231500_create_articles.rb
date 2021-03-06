class CreateArticles < ActiveRecord::Migration
  def self.up
    create_table :articles do |t|
      t.integer :board_id
      t.integer :user_id
      t.integer :article_no
      t.integer :parent_no
      t.integer :thread_no
      t.string :title
      t.text :body
      t.integer :hits_count, :default => 0
      t.integer :comments_count, :default => 0

      t.timestamps
    end
    add_index :articles, [:board_id, :article_no], :unique => true
    add_index :articles, [:board_id, :thread_no]
    add_index :articles, :user_id
  end

  def self.down
    drop_table :articles
  end
end