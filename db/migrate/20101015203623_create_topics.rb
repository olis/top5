class CreateTopics < ActiveRecord::Migration
  def self.up
    create_table :topics, :force => true do |t|
      t.string :title
      t.integer :category_id
      t.timestamps
    end
  end

  def self.down
    drop_table :topics
  end
end
