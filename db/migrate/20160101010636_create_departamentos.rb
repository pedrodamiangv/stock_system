class CreateDepartamentos < ActiveRecord::Migration
  def change
    create_table :departamentos do |t|
      t.string :departamento, :limit => 30, :null => false
      t.references :country, index: true, :null => false, foreign_key: true

      t.timestamps null: false
    end
  end
end