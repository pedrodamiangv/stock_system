class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :name, :limit => 50, :null => false
      t.text :description, :null => false
      t.references :address, index: true, :null => false, foreign_key: true

      t.timestamps null: false
    end
  end
end
