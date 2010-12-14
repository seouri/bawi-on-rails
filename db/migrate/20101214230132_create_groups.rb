class CreateGroups < ActiveRecord::Migration
  def self.up
    create_table :groups do |t|
      t.integer :parent_id
      t.string :name
      t.integer :boards_count, :default => 0
      t.timestamps
    end
    add_index :groups, :parent_id
  end

  def self.down
    drop_table :groups
  end
end