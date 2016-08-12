class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :city, :limit => 30, :null => false
      t.references :departamento, index: true, :null => false, foreign_key: true

      t.timestamps null: false
    end
  end
end
