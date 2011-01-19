class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories, :force => true do |t|
      t.string :title
      t.integer :position
      t.timestamps
    end
  end

  def self.down
    drop_table :categories
  end
end