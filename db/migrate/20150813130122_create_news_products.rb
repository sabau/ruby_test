class CreateNewsProducts < ActiveRecord::Migration
  def change
    create_table :news_products, id: false do |t|
      t.references :product, index: true, foreign_key: true
      t.references :news, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
