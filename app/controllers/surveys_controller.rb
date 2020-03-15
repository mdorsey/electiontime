class SurveysController < ApplicationController

  before_action :admin_user
  before_action :set_survey, only: [:show, :edit, :update, :destroy]

  def index
    @surveys = Survey.search(params[:search]).paginate(page: params[:page]).order('name ASC')
  end

  def create
    @survey = Survey.new(survey_params)

    if @survey.save
      flash[:success] = "Survey created successfully"
      redirect_to surveys_url
    else
      render 'new'
    end
  end

  def destroy
    if @survey.destroy
      flash[:success] = "Survey deleted"
      redirect_to surveys_url
    else
      flash[:danger] = "Deletion failed! This Survey is being used by another object and cannot be deleted."
      redirect_to @survey
    end
  end

  def edit
  end

  def new
    @survey = Survey.new
  end

  def show
  end

  def update
    if @survey.update_attributes(survey_params)
      flash[:success] = "Survey updated"
      redirect_to @survey
    else
      render 'edit'
    end
  end

  private

    def set_survey
      @survey = Survey.find(params[:id])
    end

    def survey_params
      params.require(:survey).permit(:name, :description, :survey_type_id, :election_id)
    end
end
