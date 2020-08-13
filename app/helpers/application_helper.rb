module ApplicationHelper
  def active_class(link_path)
    current_page?(link_path) ? 'active' : ""
  end

  def years_between_dates(date_from, date_to)
    ((date_to - date_from).fdiv(365)).round
  end

  def is_checked(role_id, permission_id)
    rp = RolePermission.where(role_id: role_id, permission_id: permission_id)
    if rp.present?
      true
    else
      false
    end
  end

end
