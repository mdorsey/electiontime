module SurveysHelper

  def display_survey(survey_id)
    return Survey.find(survey_id).name
  end

  def options_for_survey
    surveys = Array.new

    Survey.all.order('name ASC').each do |j|
      surveys.push([j.name, j.id])
    end

    return surveys
  end
end
