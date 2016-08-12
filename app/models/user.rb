class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  	has_and_belongs_to_many :roles
  	belongs_to :person
  	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 100, minimum:7 }, format: { with: VALID_EMAIL_REGEX }
	validates :email, uniqueness: { case_sensitive: false }, on: :edit 
end
