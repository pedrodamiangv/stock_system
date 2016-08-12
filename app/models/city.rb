class City < ActiveRecord::Base
  belongs_to :departamento
  has_many :addresses 
  validates :city, presence: true, length: { maximum: 30, minimum:3 }, :format => { :with => /\A[a-zA-ZñÑáéíóúÁÉÍÓÚ\s]+\z/ }
  validates :departamento_id, presence: true
  delegate :departamento, to: :departamento, prefix: true
end
