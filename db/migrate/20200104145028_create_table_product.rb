class CreateTableProduct < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
    	t.string "name"
    end
  end
end
