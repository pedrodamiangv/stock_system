class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string :name, :null => false
      t.string :phone
      t.string :email
      t.string :ruc
      t.text :description
      t.text :historic
      t.string :logo, :null => false

      t.timestamps null: false
    end
  end
end
