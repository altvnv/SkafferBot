class Dashboard::ScheduleController < InheritedResources::Base
  defaults resource_class: Group

  navigation_section :schedule

  def set_group
    cookies[:group_id] = params[:group_id]

    redirect_back fallback_location: root_path
  end

  def set_theme
    cookies[:theme] = params.fetch(:theme, :light)

    redirect_to root_path
  end
end
