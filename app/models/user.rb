class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :company, optional: true
  has_one_attached :profile_picture
  belongs_to :degree
  belongs_to :department
  belongs_to :designation
  has_many :employees, :class_name=>"User", :foreign_key=>"mentor"


  validates :profile_picture, blob: { content_type: ['image/png', 'image/jpg', 'image/jpeg'] }

  MARITAL_STATUS =  ["Married", "Single"].freeze
  DEPARTMENT = ["Admin" ,"HR", "ROR", "PHP", "Designing", "QA", "VR", "Android", 'Frontend']
  USER_TYPE = ["Employee", "Consultant", "Trainee"]
  JOB_STATUS = ["Active", "Inactive"]


  scope :today_birthday, -> { where( 'EXTRACT(month FROM birthday) = ? AND EXTRACT(day FROM birthday) = ?',Date.today.month, Date.today.day ) }

  scope :upcoming_birthday, -> { where( 'EXTRACT(month FROM birthday) = ? AND EXTRACT(day FROM birthday) > ?',Date.today.month, Date.today.day )}

  scope :upcoming_anniversary, -> { where( 'EXTRACT(month FROM anniversary_date) = ? AND EXTRACT(day FROM anniversary_date) >= ?',Date.today.month, Date.today.day )}

  scope :upcoming_work_anniversary, -> { where( 'EXTRACT(month FROM join_date) = ? AND EXTRACT(day FROM join_date) >= ?',Date.today.month, Date.today.day )}


  # has_many :leaves
  has_many :user_leaves, class_name: "Leave", dependent: :destroy
  belongs_to :role
  validates_presence_of :first_name, :last_name, :contact, :comp_email, :leave_bal, :emp_code , :gender, :birthday
  validates :comp_email, uniqueness: true

  def full_name
    if self.first_name && self.last_name
      (self.first_name + ' ' + self.last_name.to_s).humanize
    else
      self.comp_email
    end
  end

  Role.pluck(:name).each do |user_role|
    define_method "#{user_role}?" do
      self.role.name == user_role
    end
  end

  def user_mentor
    User.find_by(id: self.mentor.to_i)
  end

  def format_experience
    if self.experience.to_s.include? "."
      experience = self.experience.to_s.split(".")
      total_experience = experience[0] + " years " + experience[1] + " months"
    else
      total_experience = self.experience + " years "
    end
  end

  def user_month_leave month, year
    half_leave = self.user_leaves.where("leave_type IN (?)", ["first half","second half"]).where( '(EXTRACT(month FROM leave_date) = ? AND EXTRACT(year FROM leave_date) = ?) OR (EXTRACT(month FROM end_date) = ? AND EXTRACT(year FROM end_date) = ?) ',month, year, month, year ).map{ |e| e.leave_array[0].map{|e| e if (e.month == month && e.year == year) }}
    sum = self.user_leaves.where.not("leave_type IN (?)", ["first half","second half", "wfh"]).where( '(EXTRACT(month FROM leave_date) = ? AND EXTRACT(year FROM leave_date) = ?) OR (EXTRACT(month FROM end_date) = ? AND EXTRACT(year FROM end_date) = ?) ',month, year, month, year ).map{ |e| e.leave_array[0].map{|e| e if (e.month == month && e.year == year) }}
    (half_leave.flatten.compact.count/2.to_f) + sum.flatten.compact.count
  end

  def role_name
    self&.role&.name
  end
end
