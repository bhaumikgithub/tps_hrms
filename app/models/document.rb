class Document < ApplicationRecord
  include Rails.application.routes.url_helpers

  belongs_to :user
  has_one_attached :document

  def doc_name
    extension_name =  File.extname(rails_blob_path(self.document, only_path: true)).strip.downcase[1..-1]
    ext_name = extension_name.present? ? "("+extension_name.capitalize()+")" : "(Image)"
    return self.name + ext_name 
  end
end
