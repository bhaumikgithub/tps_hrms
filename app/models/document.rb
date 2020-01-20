class Document < ApplicationRecord
  include Rails.application.routes.url_helpers

  belongs_to :user
  has_one_attached :document

  def doc_name
    return self.name + " - " + self.document.filename.to_s
  end
end
