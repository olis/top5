class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items, :force => true do |t|
      t.string :title
      t.integer :toplist_id
      t.integer :position
      t.timestamps
    end
  end

  def self.down
    drop_table :items
  end
end
