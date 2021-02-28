module ApplicationHelper
  def current_class_button?(test_path)
    return 'active teal' if request.path == test_path
    ''
  end

  def current_class_label?(test_path)
    return 'ui teal left pointing' if request.path == test_path
    ''
  end

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || welcome_path
  end
end
