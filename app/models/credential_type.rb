class CredentialType < ApplicationRecord

  has_many :credentials

  validates_presence_of :name
  validates :name, uniqueness: true
end
