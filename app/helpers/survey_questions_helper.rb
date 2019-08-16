module SurveyQuestionsHelper

  def display_survey_question(survey_question_id)
    return SurveyQuestion.find(survey_question_id).question
  end

  def options_for_survey_question
    survey_questions = Array.new

    SurveyQuestion.all.order('id ASC').each do |j|
      survey_questions.push([j.question, j.id])
    end

    return survey_questions
  end
end
