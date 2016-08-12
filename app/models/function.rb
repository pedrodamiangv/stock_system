class Function < ActiveRecord::Base
	has_and_belongs_to_many :employees 
  	validates :function, presence: true, length: { maximum: 100, minimum:3 }, :uniqueness => { :message => "Esta función ya se ha almacenado"}
end
