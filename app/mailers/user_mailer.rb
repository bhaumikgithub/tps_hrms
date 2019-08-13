class UserMailer < ApplicationMailer

  def new_registration email , password
    @email = email
    @password = password

    mail to: @email, subject: "New Registration"
  end
end
