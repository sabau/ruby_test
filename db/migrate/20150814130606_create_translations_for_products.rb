class CreateTranslationsForProducts < ActiveRecord::Migration
  def up
    Product.create_translation_table! :title => :string, :description => :text

    sql = "INSERT INTO product_translations (title, description, product_id, locale, created_at, updated_at) SELECT title, description, id as product_id, 'en', date('now'), date('now') FROM products"
    ActiveRecord::Base.connection.execute(sql)

    remove_columns :products, :title, :description

  end
  def down

    add_column :products, :title, :string
    add_column :products, :description, :text

    sql = "UPDATE products, product_translations SET products.title = product_translations.title, products.description = product_translations.description WHERE products.id = product_translations.product_id"
    ActiveRecord::Base.connection.execute(sql)

    Product.drop_translation_table!
  end
end
