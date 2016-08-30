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
	validates :password, presence: true, length: { maximum: 100, minimum:6 }

  def is_admin?
    self.roles.each do |role|
      role.include? "admin"
    end
  end

  def full_name_doc
    self.person.full_name_doc
  end

  def full_name
    self.person.full_name
  end
end
