class CreateTableStores < ActiveRecord::Migration[6.0]
  def change
    create_table :stores do |t|
    	 t.integer "store_name"
    	 t.string "latitude"
    	 t.string "longitude"
    	 t.string "s_eta"
    end
  end
end
