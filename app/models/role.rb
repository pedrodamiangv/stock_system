class Role < ActiveRecord::Base
	has_and_belongs_to_many :users 
  	validates :role, presence: true, length: { maximum: 100, minimum:3 }, :uniqueness => { :message => "Este rol ya se ha almacenado"}
end
