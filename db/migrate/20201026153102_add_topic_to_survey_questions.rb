class AddTopicToSurveyQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :survey_questions, :topic, :string
  end
end
