class CreateRolesUsers < ActiveRecord::Migration
  def change
    create_table :roles_users do |t|
    	t.integer :role_id, index: true, :null => false, foreign_key: true
      	t.integer :user_id, index: true, :null => false, foreign_key: true
    end
  end
end
