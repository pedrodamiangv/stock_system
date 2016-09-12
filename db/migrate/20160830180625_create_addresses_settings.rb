class CreateAddressesSettings < ActiveRecord::Migration
  def change
    create_table :addresses_settings, :id => false do |t|
      t.references :setting, :null => false
      t.references :address, :null => false
    end
    add_index :addresses_settings, :setting_id
    add_index :addresses_settings, :address_id
  end 
end
