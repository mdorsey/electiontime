module LogsHelper

  def display_log(log_id)

    log_text = '';
    
    if log_id
      log = Log.find(log_id)
      log_text = display_user(log.user_id) + ' - ' + display_log_type(log.log_type_id) + ' - ' + log.message
    end

    return log_text
  end
end
