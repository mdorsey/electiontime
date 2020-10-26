class SurveyQuestionsController < ApplicationController

  before_action :admin_user
  before_action :set_survey_question, only: [:show, :edit, :update, :destroy]

  def index
    @survey_questions = SurveyQuestion.search(params[:search]).paginate(page: params[:page]).order('question ASC')
  end

  def create
    @survey_question = SurveyQuestion.new(survey_question_params)

    if @survey_question.save
      flash[:success] = "Survey Question created successfully"
      redirect_to survey_questions_url
    else
      render 'new'
    end
  end

  def destroy
    if @survey_question.destroy
      flash[:success] = "Survey Question deleted"
      redirect_to survey_questions_url
    else
      flash[:danger] = "Deletion failed! This Survey Question is being used by another object and cannot be deleted."
      redirect_to @survey_question
    end
  end

  def edit
  end

  def new
    @survey_question = SurveyQuestion.new
  end

  def show
  end

  def update
    if @survey_question.update_attributes(survey_question_params)
      flash[:success] = "Survey Question updated"
      redirect_to @survey_question
    else
      render 'edit'
    end
  end

  private

    def set_survey_question
      @survey_question = SurveyQuestion.find(params[:id])
    end

    def survey_question_params
      params.require(:survey_question).permit(:survey_id, :topic, :question, :order)
    end
end
