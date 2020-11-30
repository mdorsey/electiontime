module SurveyAnswersHelper

  def display_survey_answer(survey_answer_id)
    survey_answer = SurveyAnswer.find(survey_answer_id)
    text = display_participant(survey_answer.participant_id, true) + ': ' + survey_answer.answer[0, 100] + '...'
    return text
  end

  def display_survey_answer_text(survey_question_id, participant_id)

    answer_text = ''

    survey_answer = SurveyAnswer.find_by(survey_question_id: survey_question_id, participant_id: participant_id)
    if survey_answer
      answer_text = survey_answer.answer
    end

    return answer_text
  end

  def display_survey_source_text(survey_question_id, participant_id)

    source_text = ''

    survey_answer = SurveyAnswer.find_by(survey_question_id: survey_question_id, participant_id: participant_id)
    if survey_answer
      source_text = survey_answer.source
    end

    return source_text 
  end
end
