class AddNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :surname, :string
    add_column :users, :date_of_birth, :date
    add_column :users, :is_male, :boolean
  end
end
