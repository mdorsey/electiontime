module SurveyAnswersHelper

  def display_survey_answer(survey_question_id, participant_id)

    answer_text = ''

    survey_answer = SurveyAnswer.find_by(survey_question_id: survey_question_id, participant_id: participant_id)
    if survey_answer
      answer_text = survey_answer.answer
    end

    return answer_text
  end

  def display_survey_source(survey_question_id, participant_id)

    source_text = ''

    survey_source = SurveyAnswer.find_by(survey_question_id: survey_question_id, participant_id: participant_id)
    if survey_source
      source_text = survey_source.source
    end

    return source_text 
  end
end
