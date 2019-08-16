module SurveyTypesHelper

  def display_survey_type(survey_type_id)
    return SurveyType.find(survey_type_id).name
  end

  def options_for_survey_type
    survey_types = Array.new

    SurveyType.all.order('name ASC').each do |j|
      survey_types.push([j.name, j.id])
    end

    return survey_types
  end
end
