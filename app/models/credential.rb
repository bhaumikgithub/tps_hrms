class Credential < ApplicationRecord
  belongs_to :credential_type

  validates_presence_of :project_name, :notes
end
