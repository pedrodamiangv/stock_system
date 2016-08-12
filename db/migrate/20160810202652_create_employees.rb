class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.references :person, index: true, foreign_key: true
      t.date :contract_date, :null => false
      t.string :attachment

      t.timestamps null: false
    end
  end
end
