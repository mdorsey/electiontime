class SurveyAnswersController < ApplicationController

  before_action :admin_user
  before_action :set_survey_answer, only: [:show, :edit, :update, :destroy]

  def index
    @survey_answers = SurveyAnswer.paginate(page: params[:page]).order('answer ASC')
  end

  def create
    @survey_answer = SurveyAnswer.new(survey_answer_params)

    if @survey_answer.save
      flash[:info] = "Survey Answer created successfully"
      redirect_to survey_answers_url
    else
      render 'new'
    end
  end

  def destroy
    if @survey_answer.destroy
      flash[:success] = "Survey Answer deleted"
      redirect_to survey_answers_url
    else
      flash[:danger] = "Deletion failed! This Survey Answer is being used by another object and cannot be deleted."
      redirect_to @survey_answer
    end
  end

  def edit
  end

  def new
    @survey_answer = SurveyAnswer.new
  end

  def show
  end

  def update
    if @survey_answer.update_attributes(survey_answer_params)
      flash[:success] = "Survey Answer updated"
      redirect_to @survey_answer
    else
      render 'edit'
    end
  end

  private

    def set_survey_answer
      @survey_answer = SurveyAnswer.find(params[:id])
    end

    def survey_answer_params
      params.require(:survey_answer).permit(:survey_question_id, :participant_id, :answer, :source)
    end
end
