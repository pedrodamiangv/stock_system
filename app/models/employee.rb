class Employee < ActiveRecord::Base
  belongs_to :person
  has_and_belongs_to_many :functions
  mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.
  validates :contract_date, presence: true
  validates :person_id, presence: true
end
