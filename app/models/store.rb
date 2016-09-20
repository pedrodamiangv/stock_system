class Store < ActiveRecord::Base
	belongs_to :address
	validates :name, presence: true, length: { maximum: 50, minimum:3 }
	validates :name, uniqueness: { case_sensitive: false }, on: :edit 
end
