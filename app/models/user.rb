class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  audited only: [:user_type]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:trackable
  belongs_to :company, optional: true
  has_one_attached :profile_picture
  # belongs_to :degree
  # belongs_to :department
  # belongs_to :designation
  has_many :employees, :class_name=>"User", :foreign_key=>"mentor"
  has_many :free_leaves
  has_many :leave_reports
  has_many :educations
  has_many :user_designations
  has_many :user_types
  has_many :documents
  has_many :work_histories
  has_many :project_members
  has_many :projects, through: :project_members
  has_many :checklist_item_users,dependent: :destroy
  has_many :checklist_items, through: :checklist_item_users
  has_many :checklist_users,dependent: :destroy
  has_many :checklists, through: :checklist_users
  has_many :asset_histories
  has_many :trackers
  has_many :reminder_users
  # has_many :reminders, through: :reminder_users
  has_many :reminders

  validates :profile_picture, blob: { content_type: ['image/png', 'image/jpg', 'image/jpeg'] }

  MARITAL_STATUS =  ["Married", "Single"].freeze
  DEPARTMENT = ["Admin" ,"HR", "ROR", "PHP", "Designing", "QA", "VR", "Android", 'Frontend']
  USER_TYPE = ["Consultant",  "Director", "Employee", "Trainee",]
  JOB_STATUS = ["Active", "Inactive"]


  # scope :today_birthday, -> { where( 'EXTRACT(month FROM birthday) = ? AND EXTRACT(day FROM birthday) = ?',Date.today.month, Date.today.day ) }

  scope :upcoming_birthday, -> { where( '(EXTRACT(month FROM birthday) = ? AND EXTRACT(day FROM birthday) >= ?) OR (EXTRACT(month FROM birthday) = ? AND EXTRACT(day FROM birthday) >= ?) OR (EXTRACT(month FROM birthday) = ? AND EXTRACT(day FROM birthday) <= ?)', Date.today.month, Date.today.day,(Date.today-4).month, (Date.today-4).day, (Date.today + 1.month).month, (Date.today).day ).order("extract(month from birthday) ASC").order("extract(day from birthday) ASC")}

  scope :upcoming_anniversary, -> { where( '(EXTRACT(month FROM anniversary_date) = ? AND EXTRACT(day FROM anniversary_date) >= ?) OR (EXTRACT(month FROM anniversary_date) = ? AND EXTRACT(day FROM anniversary_date) >= ?) OR (EXTRACT(month FROM anniversary_date) = ? AND EXTRACT(day FROM anniversary_date) <= ?)', Date.today.month, Date.today.day ,(Date.today-4).month, (Date.today-4).day, (Date.today + 1.month).month, (Date.today).day ).order("extract(month from anniversary_date) ASC").order("extract(day from anniversary_date) ASC")}

  scope :upcoming_work_anniversary, -> { where( '(EXTRACT(month FROM join_date) = ? AND EXTRACT(day FROM join_date) >= ?) OR (EXTRACT(month FROM join_date) = ? AND EXTRACT(day FROM join_date) >= ?) OR (EXTRACT(month FROM join_date) = ? AND EXTRACT(day FROM join_date) <= ?)', Date.today.month, Date.today.day ,(Date.today-4).month, (Date.today-4).day, (Date.today + 1.month).month, (Date.today).day ).order("extract(month from join_date) ASC").order("extract(day from join_date) ASC")}


  # has_many :leaves
  has_many :user_leaves, class_name: "Leave", dependent: :destroy
  belongs_to :role
  validates_presence_of :first_name, :last_name, :contact, :comp_email, :leave_bal, :emp_code , :gender, :birthday
  validates :comp_email, uniqueness: true

  def full_name
    if self.first_name && self.last_name
      (self.first_name + ' ' + self.last_name.to_s).titleize
    else
      self.comp_email
    end
  end

  def self.check_day(date)
    date = date.to_date
    if date.strftime('%d %m') == Date.today.strftime('%d %m')
      return 'Today'
    elsif date.strftime('%d %m') == (Date.today + 1.day).strftime('%d %m')
      return 'Tomorrow'
    else
      if date.year > 2007
        return date.strftime("#{date.day.ordinalize} %B %Y")
      else
        return date.strftime("#{date.day.ordinalize} %B ")
      end
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

  def user_current_mentor
    User.find_by(id: self.user_current_designation&.mentor&.to_i)
  end

  def user_current_designation
    self.user_designations.find_by_is_current(true)
  end

  def format_experience
    if self.experience.to_s.include? "."
      experience = self.experience.to_s.split(".")
      total_experience = experience[0] + " Years " + experience[1] + " Months"
    else
      total_experience = self.experience + " Years "
    end
  end

  def user_month_leave month, year
    half_leave = self.user_leaves.where("leave_type IN (?)", ["first half","second half"]).where("((EXTRACT(month FROM leave_date) <= ? AND EXTRACT(year FROM leave_date) = ?) OR (EXTRACT(month FROM end_date) >= ? AND EXTRACT(year FROM end_date) = ?))", month, year, month, year).map{ |e| e.leave_array[0].map{|e| e if (e.month == month && e.year == year) }}
    # sum = self.user_leaves.where.not("leave_type IN (?)", ["first half","second half", "wfh"]).where( '(EXTRACT(month FROM leave_date) = ? AND EXTRACT(year FROM leave_date) = ?) OR (EXTRACT(month FROM end_date) = ? AND EXTRACT(year FROM end_date) = ?) ',month, year, month, year ).map{ |e| e.leave_array[0].map{|e| e if (e.month == month && e.year == year) }}

    sum = self.user_leaves.where.not("leave_type IN (?)", ["first half","second half", "wfh"]).where("((EXTRACT(month FROM leave_date) <= ? AND EXTRACT(year FROM leave_date) = ?) OR (EXTRACT(month FROM end_date) >= ? AND EXTRACT(year FROM end_date) = ?))", month, year, month, year).map{ |e| e.leave_array[0].map{|e| e if (e.month == month && e.year == year) }}

    (half_leave.flatten.compact.count/2.to_f) + sum.flatten.compact.count
  end

  def role_name
    self&.role&.name
  end

  def self.leave_report
    @start_date = Date.today.at_beginning_of_month
    @end_date = Date.today.at_end_of_month
    if Date.today.at_beginning_of_month == Date.today.at_beginning_of_month
      User.where.not(user_type: "Director").where(job_status: 'Active').each do |user|
        # Return Taken Leave Balance
        # @taken_leave = User.taken_leave(user,@start_date,@end_date)
        @taken_leave = user.user_month_leave((@start_date - 1.month).month, (@start_date - 1.month).year)
        prev_extra_leave = user.free_leaves.find_by_leave_month(@start_date - 1.month)
        @free_leave = prev_extra_leave.present? ? prev_extra_leave.extra_leave + 1 : 1
        # @free_leave = 1
        @prev_leave_bal = user.leave_reports.find_by_start_month(@start_date.at_beginning_of_month - 2.month).try(:current_leave_bal)
        @prev_month_leave_bal = @prev_leave_bal.nil? || @prev_leave_bal < 0 ? 0 : @prev_leave_bal
        @current_bal = ( @prev_month_leave_bal.to_f + @free_leave.to_f ) - @taken_leave.to_f
        # Create User Report
        User.create_leave_report(user)
        # Update leave balance if prev month leave balance is less than 0
        @current_bal < 0 ? user.update(leave_bal: 0) : user.update(leave_bal: @current_bal)

        # Add 1 free leave balance
        current_extra_leave = user.free_leaves.find_by_leave_month(@start_date)
        @current_free_leave = current_extra_leave.present? ? current_extra_leave.extra_leave + 1 : 1

        if prev_extra_leave.present?
          free_total = prev_extra_leave.extra_leave - @taken_leave.to_f
          if free_total > 0
            user.update(leave_bal: (user.leave_bal - free_total))
          end
        end
        user.update(leave_bal: (user.leave_bal.to_f + @current_free_leave))

        # Update current month leave if taken any leave on this current month
        current_month_leave = User.current_month_leave(user,@start_date)
        user.update(leave_bal: (user.leave_bal.to_f - current_month_leave))
      end
    end
  end

  def self.taken_leave(user,start_date,end_date)

    # user_leaves = user.user_leaves.where("((EXTRACT(month FROM leave_date) <= ? AND EXTRACT(year FROM leave_date) = ?) AND (EXTRACT(month FROM end_date) >= ? AND EXTRACT(year FROM end_date) = ?))", (start_date - 1.month).month,(start_date - 1.month).year, (start_date - 1.month).month,(start_date - 1.month).year)

    # Working the below query

    user_leaves = user.user_leaves.where("(leave_date <= ? OR leave_date >= ?) AND (end_date >= ? OR end_date >= ?) ",@start_date, @start_date,@end_date,@start_date )

    taken_leave = 0
    user_leaves.each do |leave|
      leave = leave.total_leave_count(start_date - 1.month)
      taken_leave += leave
    end
    return taken_leave
  end

  def self.create_leave_report(user)
    user.leave_reports.create(start_month: @start_date - 1.month, end_month: (@end_date - 1.month).at_end_of_month, prev_month_leave_bal: @prev_month_leave_bal, free_leave: @free_leave, taken_leave: @taken_leave, current_leave_bal: @current_bal)
  end

  def self.current_month_leave(user, start_date)
    # current_month_leave = user.user_leaves.where("leave_date BETWEEN ? AND ? OR end_date BETWEEN ? AND ?", @start_date,@end_date,@start_date,@end_date)
    current_month_leave = user.user_leaves.where("((EXTRACT(month FROM leave_date) <= ? AND EXTRACT(year FROM leave_date) = ?) AND (EXTRACT(month FROM end_date) >= ? AND EXTRACT(year FROM end_date) = ?))", start_date.month,start_date.year, start_date.month,start_date.year)
    curr_taken_leave = 0
    current_month_leave.each do |leave|
      leave = leave.total_leave_count(start_date)
      curr_taken_leave += leave
    end
    return curr_taken_leave
  end
end
