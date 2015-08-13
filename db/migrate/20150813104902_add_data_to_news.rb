class AddDataToNews < ActiveRecord::Migration
  def change
    add_column :news, :data, :date
  end
end
