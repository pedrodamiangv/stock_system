class CreatePeopleAddresses < ActiveRecord::Migration
  def change
    create_table :addresses_people, :id => false do |t|
      t.references :person, :null => false
      t.references :address, :null => false
    end
    add_index :addresses_people, :person_id
    add_index :addresses_people, :address_id
  end 
end
