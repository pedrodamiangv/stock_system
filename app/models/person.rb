class Person < ActiveRecord::Base
	has_and_belongs_to_many :addresses
	belongs_to :employee
	belongs_to :user

	validates :first_name, presence: true, length: { maximum: 30, minimum:3 }
	validates :last_name, presence: true, length: { maximum: 30, minimum:3 }
	validates :doc, presence: true, length: { maximum: 15, minimum:3 }
	validates :doc, uniqueness: { case_sensitive: false }, on: :edit
	validates :sex, presence: true, length: { maximum: 15 }
	validates :phone, presence: true, length: { maximum: 15, minimum:6 }

	def full_name
   	  self.first_name.capitalize + ' ' + self.last_name.capitalize
    end

    def full_name_doc
   	  self.first_name.capitalize + ' ' + self.last_name.capitalize + ' - ' + self.doc
    end
end
