class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.references :city, index: true, :null => false, foreign_key: true
      t.string :direccion, :limit => 100, :null => false
      t.string :calle, :limit => 100, :null => false
      t.string :barrio, :limit => 30, :null => false

      t.timestamps null: false
    end
  end
end
