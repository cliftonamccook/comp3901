module RequirementGroupsHelper
  def polymophic_path_builder(path_action, parent_model, polymophic_model)
    return "/#{parent_model.class.table_name}/#{parent_model.id}/#{polymophic_model.class.table_name}#{action_path_ending(path_action, polymophic_model)}"
  end

  def action_path_ending(path_action, polymophic_model)
    ending_path = "/#{path_action}"

    if path_action == 'edit'
      ending_path = "/#{polymophic_model.id}/#{path_action}" 
    end

    if path_action == 'show'
      ending_path = "/#{polymophic_model.id}"
    end

    return ending_path
  end
end
