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
end