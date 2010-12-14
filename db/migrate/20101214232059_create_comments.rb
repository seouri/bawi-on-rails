class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.integer :board_id
      t.integer :article_id
      t.integer :comment_no
      t.text :body

      t.timestamps
    end
    add_index :comments, [:board_id, :comment_no], :unique => true
    add_index :comments, [:board_id, :article_id]
  end

  def self.down
    remove_index :comments, :column_name
    drop_table :comments
  end
end