class CreateTableDriver < ActiveRecord::Migration[6.0]
  def change
    create_table :drivers do |t|
    	t.string "name"
    	t.boolean "available"
    end
  end
end
