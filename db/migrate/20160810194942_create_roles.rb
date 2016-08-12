class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :role, :limit => 100, :null => false
      t.string :description

      t.timestamps null: false
    end
  end
end
