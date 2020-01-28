class SuggestionForm < MailForm::Base

  attribute :name,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :title,    :validate => true
  attribute :comments,  :validate => true
  # attribute :user
  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => "Suggestions for HRMS",
      :to => "nency.tps@gmail.com,  info@techplussoftware.com, hr@techplussoftware.com",
      :from => %(<#{email}>)
    }
  end
end