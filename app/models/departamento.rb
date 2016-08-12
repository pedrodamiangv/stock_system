class Departamento < ActiveRecord::Base
  belongs_to :country
  has_many :cities 
  validates :departamento, presence: true, length: { maximum: 30, minimum:3 }, :format => { :with => /\A[a-zA-ZñÑáéíóúÁÉÍÓÚ\s]+\z/ }
  validates :country_id, presence: true
  delegate :country, to: :country, prefix: true
end