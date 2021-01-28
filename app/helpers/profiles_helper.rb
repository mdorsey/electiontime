module ProfilesHelper

  def get_biography_max_character_length()

    system_setting = SystemSetting.find_by(name: "biography_max_character_length")

    if system_setting
      length = system_setting.setting.to_i
    else
      # Default setting
      length = 1000
    end

    return length
  end

  def get_survey_answer_max_character_length()

    system_setting = SystemSetting.find_by(name: "survey_answer_max_character_length")

    if system_setting
      length = system_setting.setting.to_i
    else
      # Default setting
      length = 1000
    end

    return length
  end
end