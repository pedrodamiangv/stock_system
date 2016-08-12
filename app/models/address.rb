class Address < ActiveRecord::Base
	belongs_to :city
	has_and_belongs_to_many :people

	validates :direccion, presence: true, length: { maximum: 100, minimum:3 }
	validates :calle, presence: true, length: { maximum: 100, minimum:3 }
	validates :barrio, presence: true, length: { maximum: 30, minimum:3 }
	validates :city_id, presence: true
  	delegate :city, to: :city, prefix: true
end
