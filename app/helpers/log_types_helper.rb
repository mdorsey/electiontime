module LogTypesHelper

  def display_log_type(log_type_id)
    return LogType.find(log_type_id).name
  end

  def options_for_log_type
    log_types = Array.new

    LogType.all.order('name ASC').each do |lt|
      log_types.push([lt.name, lt.id])
    end

    return log_types
  end
end
