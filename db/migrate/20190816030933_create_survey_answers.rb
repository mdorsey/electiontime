class CreateSurveyAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :survey_answers do |t|
      t.references :survey_question, foreign_key: true
      t.references :participant, foreign_key: true
      t.text :answer
      t.text :source

      t.timestamps
    end
  end
end
