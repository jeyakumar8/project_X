class CreateTableStores < ActiveRecord::Migration[6.0]
  def change
    create_table :stores do |t|
    	 t.string "store_name"
    	 t.decimal "latitude"
    	 t.decimal "longitude"
    	 t.string "s_eta"
    end
  end
end
