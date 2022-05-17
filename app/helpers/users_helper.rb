module UsersHelper
  @permission_notice = "You do not have permission to do that action"

  def staff_member?
    current_user and current_user.staff_member?
  end

  def student?
    current_user and current_user.student?
  end

  def staff_admin?
    current_user and current_user.staff_admin?
  end

  def can_create?(department_id)
    staff_admin? or (staff_member? and current_user.can_create?(department_id))
  end

  def can_update?(department_id)
    staff_admin? or (staff_member? and current_user.can_update?(department_id))
  end

  def can_discontinue?(department_id)
    staff_admin? or (staff_member? and current_user.can_discontinue?(department_id))
  end

  def only_admin!
    if !staff_admin?
      redirect_to root_path, alert: @permission_notice 
    end
  end

  def only_staff_members
    if student?
      redirect_to root_path, alert: @permission_notice 
    end
  end

  def only_student
    if student?
      redirect_to root_path, alert: @permission_notice 
    end
  end

  def student_progress
    StudentProgress.where(user_id: current_user.id).first if current_user and current_user.student?
  end

  def status_text(user)
    return '<span class="badge bg-green">Activated</span>'.html_safe if user.activated?
    return '<span class="badge bg-danger">Deactivated</span>'.html_safe 
  end

  def status_action_link(user)
    return link_to 'Deactivate', deactivate_account_user_path(user), :method => :patch, class: "btn btn-danger ml-1",
            data: { confirm: "Are you sure you want to deactive this user's account?" } if user.activated?
    return link_to 'Activate', activate_account_user_path(user), :method => :patch, class: "btn btn-green ml-1",
            data: { confirm: "Are you sure you want to active this user's account?" }
  end
end