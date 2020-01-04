class CreateTableStoresProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :stores_products do |t|
    	t.integer   "product_id"
	    t.integer  "store_id"
	    t.string "product_rating"
    end
  end
end
