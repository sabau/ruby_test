class RenameColumnDataToDateForNews < ActiveRecord::Migration
  def change
    rename_column :news, :data, :date
  end
end
