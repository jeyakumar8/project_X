class CreateTableDriverStore < ActiveRecord::Migration[6.0]
  def change
        create_table :stores_drivers do |t|
    	t.integer   "driver_id"
	    t.integer  	"store_id"
	    t.string 	"eta"
    end
  end
end
