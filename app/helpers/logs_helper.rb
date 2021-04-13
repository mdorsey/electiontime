module LogsHelper

  def display_log(log_id)
   
    log_text = ''

    if log_id
      log = Log.find(log_id)

      log_text = log.message + ' ('

      if log.user_id
        log_text += display_user(log.user_id) + ', '
      end

      log_text += log.created_at.localtime.to_s + ')'
    end

    return log_text
  end
end
