class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :company, optional: true 

  has_many :leaves



  def full_name
    if self.first_name
      self.first_name
    else
      self.email
    end
  end
end
