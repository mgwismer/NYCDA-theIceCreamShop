class CreateProductsWishlists < ActiveRecord::Migration[5.0]
  def change
    create_table :products_wishlists do |t|
      t.references :product, foreign_key: true
      t.references :wishlist, foreign_key: true
    end
  end
end
