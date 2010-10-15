class CreateToplists < ActiveRecord::Migration
  def self.up
    create_table :toplists, :force => true do |t|
      t.integer :user_id
      t.integer :topic_id
      t.timestamps
    end
  end

  def self.down
    drop_table :toplists
  end
end
