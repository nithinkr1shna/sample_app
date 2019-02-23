class AddEmailUniquenessIndex < ActiveRecord::Migration[5.2]
  def change
    add_index :users, :email , :unique => true
  end

  def self.down
    remove_index :users, :email
  end
end
