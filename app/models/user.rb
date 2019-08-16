class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :company, optional: true 
  MARITAL_STATUS =  ["Married", "Single"].freeze
  DEPARTMENT = ["ROR", "PHP", "Designing", "QA", "VR", "Android", 'Frontend']
  USER_TYPE = ["Employee", "Consultant", "Trainee"]
  JOB_STATUS = ["Active", "Inactive"]
  has_many :leaves
  validates_presence_of :first_name, :last_name, :contact

  def full_name
    if self.first_name
      self.first_name + ' ' + self.last_name.to_s
    else
      self.email
    end
  end


  def user_mentor
    User.find_by(id: self.mentor.to_i)
  end
end
