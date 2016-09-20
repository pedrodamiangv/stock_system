class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string :name, :null => false, :limit => 30
      t.string :phone, :limit => 30
      t.string :email
      t.string :ruc, :limit => 30
      t.text :description
      t.text :historic
      t.string :logo, :null => false

      t.timestamps null: false
    end
  end
end
