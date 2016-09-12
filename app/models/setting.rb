class Setting < ActiveRecord::Base
	has_and_belongs_to_many :addresses
	mount_uploader :logo, ImagenUploader # Tells rails to use this uploader for this model.

	validates :name, presence: true, length: { maximum: 50, minimum:3 }
	validates :logo, presence: true
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, length: { maximum: 100, minimum:7 }, format: { with: VALID_EMAIL_REGEX }
	validates :phone, length: { maximum: 15, minimum:6 }
	validates :ruc, uniqueness: { case_sensitive: false }, on: :edit
end
