class HomeController < ApplicationController
  
  def index
    @users = User.where.not(user_type: "Director").where(job_status: 'Active').order(first_name: :asc)
    @leaves = Leave.where("end_date >= (?) AND end_date <= (?) OR leave_date >= (?) AND leave_date <= (?) OR leave_date <= (?) AND end_date >= (?)", Date.today, Date.today + 7.days, Date.today, Date.today + 7.days, Date.today, Date.today + 7.days).order('leave_date ASC')
    # @employees_leaves = Leave.joins(:user).where('leave_date >= ? and leave_date <= ? and mentor = ? ', Date.today, Date.today + 14.days, current_user.id.to_s)
    @employees_leaves = Leave.joins(user: :user_designations).where('leave_date >= ? and leave_date <= ? and user_designations.mentor = ? and is_current = true', Date.today, Date.today + 14.days, current_user.id.to_s)
    @employees_leaves += current_user.user_leaves.where('leave_date >= ? and leave_date <= ?', Date.today, Date.today + 7.days).order('leave_date ASC')
    @arrange_sessions = ArrangeSession.where('date >= ?', Date.today).order(date: :desc)
    @event_links = EventLink.where("created_at < ?", Date.today + 2.days)


    # Work anniversary
    u = User.where(job_status: 'Active').upcoming_work_anniversary.where( '(EXTRACT(month FROM join_date) = ? AND EXTRACT(day FROM join_date) > ?) OR (EXTRACT(month FROM join_date) = ? AND EXTRACT(day FROM join_date) <= ?)',Date.today.month, (Date.today).day, (Date.today + 1.month).month, (Date.today).day ).order("extract(month from join_date) ASC").order("extract(day from join_date) ASC").first
    next_event = User.where(job_status: 'Active').where( '(EXTRACT(month FROM join_date) >= ? AND EXTRACT(day FROM join_date) >= ?)', u.join_date.month, u.join_date.day).order("extract(month from join_date) ASC").order("extract(day from join_date) ASC").group_by(&:join_date) if u.present?
    @next_users = next_event.present? ? next_event.first[1].pluck(:email) : []
    today_event = User.where(job_status: 'Active').where( '(EXTRACT(month FROM join_date) = ? AND EXTRACT(day FROM join_date) = ?)', Date.today.month, Date.today.day).order("extract(month from join_date) ASC").order("extract(day from join_date) ASC").group_by(&:join_date)
    @today_user = today_event.present? ? today_event.first[1].pluck(:email) : []

    # Marriage anniversary
    c_user = User.where(job_status: 'Active').upcoming_anniversary.where( '(EXTRACT(month FROM anniversary_date) = ? AND EXTRACT(day FROM anniversary_date) > ?) OR (EXTRACT(month FROM anniversary_date) = ? AND EXTRACT(day FROM anniversary_date) <= ?)',Date.today.month, (Date.today).day, (Date.today + 1.month).month, (Date.today).day ).order("extract(month from anniversary_date) ASC").order("extract(day from anniversary_date) ASC").first
    next_anniversary_event = User.where(job_status: 'Active').where( '(EXTRACT(month FROM anniversary_date) >= ? AND EXTRACT(day FROM anniversary_date) >= ?)', c_user.anniversary_date.month, c_user.anniversary_date.day).order("extract(month from anniversary_date) ASC").order("extract(day from anniversary_date) ASC").group_by(&:anniversary_date) if c_user.present?
    @next_anniversary_user = next_anniversary_event.present? ? next_anniversary_event.first[1].pluck(:email) : []
    today_anniversary_event = User.where(job_status: 'Active').where( '(EXTRACT(month FROM anniversary_date) = ? AND EXTRACT(day FROM anniversary_date) = ?)', Date.today.month, Date.today.day).order("extract(month from anniversary_date) ASC").order("extract(day from anniversary_date) ASC").group_by(&:anniversary_date)
    @today_anniversary_user = today_anniversary_event.present? ? today_anniversary_event.first[1].pluck(:email) : []

    # Birthday
    cur_user = User.where(job_status: 'Active').upcoming_birthday.where( '(EXTRACT(month FROM birthday) = ? AND EXTRACT(day FROM birthday) > ?) OR (EXTRACT(month FROM birthday) = ? AND EXTRACT(day FROM birthday) <= ?)',Date.today.month, (Date.today).day, (Date.today + 1.month).month, (Date.today).day ).order("extract(month from birthday) ASC").order("extract(day from birthday) ASC").first
    next_birthday_event = User.where(job_status: 'Active').where( '(EXTRACT(month FROM birthday) >= ? AND EXTRACT(day FROM birthday) >= ?)', cur_user.birthday.month, cur_user.birthday.day).order("extract(month from birthday) ASC").order("extract(day from birthday) ASC").group_by(&:birthday) if cur_user.present?
    @next_birthday_user = next_birthday_event.present? ? next_birthday_event.first[1].pluck(:email) : []
    today_birthday_event = User.where(job_status: 'Active').where( '(EXTRACT(month FROM birthday) = ? AND EXTRACT(day FROM birthday) = ?)', Date.today.month, Date.today.day).order("extract(month from birthday) ASC").order("extract(day from birthday) ASC").group_by(&:birthday)
    @today_birthday_user = today_birthday_event.present? ? today_birthday_event.first[1].pluck(:email) : []
  end

  def employee_handbook
  end

  def employee_designation
    @departments = Department.all.includes(:users)
  end

  def add_leave
    User.all.each do |user|
      leave_bal = user.leave_bal.present? ? user.leave_bal + 1 : 0
      user.update(leave_bal: leave_bal, leave_added_on: Date.today)
    end
    current_user.leave_added_on = Date.today
    current_user.save(validate: false)
    redirect_to root_path
  end

  def create_leave_report
    User.leave_report
    User.where(role_id: 1).each do |user|
      user.leave_report_added_on = Date.today.at_beginning_of_month
      user.save(validate: false)
    end
    redirect_to root_path
  end
end
