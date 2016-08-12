class CreateFunctions < ActiveRecord::Migration
  def change
    create_table :functions do |t|
      t.string :function, :limit => 100, :null => false
      t.string :description

      t.timestamps null: false
    end
  end
end
