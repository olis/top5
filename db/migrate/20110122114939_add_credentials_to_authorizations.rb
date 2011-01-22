class AddCredentialsToAuthorizations < ActiveRecord::Migration
  def self.up
    add_column :authorizations, :ctoken, :string
    add_column :authorizations, :csecret, :string
  end

  def self.down
    remove_column :authorization, :csecret
    remove_column :authorizations, :ctoken
  end
end