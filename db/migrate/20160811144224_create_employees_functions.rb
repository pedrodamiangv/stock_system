class CreateEmployeesFunctions < ActiveRecord::Migration
  def change
    create_table :employees_functions do |t|
    	t.references :employee, :null => false
      	t.references :function, :null => false
    end

    add_index :employees_functions, :employee_id
    add_index :employees_functions, :function_id
  end
end
