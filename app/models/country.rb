class Country < ActiveRecord::Base
  	has_many :departamentos 
  	validates :country, presence: true, length: { maximum: 30, minimum:3 }, :format => { :with => /\A[a-zA-ZñÑáéíóúÁÉÍÓÚ\s]+\z/ }, :uniqueness => { :message => "Este pais ya se ha almacenado"}
end
