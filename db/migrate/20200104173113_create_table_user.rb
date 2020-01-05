class CreateTableUser < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
    	t.string "username"
    	t.string "latitude"
    	t.string "longitude"
    end
  end
end
