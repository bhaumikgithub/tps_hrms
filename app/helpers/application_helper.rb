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

  def is_selected(user_id, checklist_item_id)
    ciu = ChecklistItemUser.where(user_id: user_id, checklist_item_id: checklist_item_id)
    if ciu.present?
      true
    else
      false
    end
  end

end
