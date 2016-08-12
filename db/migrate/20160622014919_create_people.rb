class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :first_name, :limit => 30, :null => false
      t.string :last_name, :limit => 30, :null => false
      t.string :doc, :limit => 15, :null => false
      t.string :phone, :limit => 15, :null => false
      t.string :sex, :limit => 30, :null => false
      t.date :birthdate

      t.timestamps null: false
    end
  end
end
