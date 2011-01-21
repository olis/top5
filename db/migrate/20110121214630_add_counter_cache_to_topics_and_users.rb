class AddCounterCacheToTopicsAndUsers < ActiveRecord::Migration
  def self.up
    add_column :topics, :toplists_count, :integer, :default => 0
    add_column :users, :toplists_count, :integer, :default => 0
  end

  def self.down
    remove_column :users, :toplists_counter
    remove_column :topics, :toplist_counter
  end
end