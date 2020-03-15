class SurveyTypesController < ApplicationController

  before_action :admin_user
  before_action :set_survey_type, only: [:show, :edit, :update, :destroy]

  def index
    @survey_types = SurveyType.search(params[:search]).paginate(page: params[:page]).order('name ASC')
  end

  def create
    @survey_type = SurveyType.new(survey_type_params)

    if @survey_type.save
      flash[:success] = "Survey Type created successfully"
      redirect_to survey_types_url
    else
      render 'new'
    end
  end

  def destroy
    if @survey_type.destroy
      flash[:success] = "Survey Type deleted"
      redirect_to survey_types_url
    else
      flash[:danger] = "Deletion failed! This Survey Type is being used by another object and cannot be deleted."
      redirect_to @survey_type
    end
  end

  def edit
  end

  def new
    @survey_type = SurveyType.new
  end

  def show
  end

  def update
    if @survey_type.update_attributes(survey_type_params)
      flash[:success] = "Survey Type updated"
      redirect_to @survey_type
    else
      render 'edit'
    end
  end

  private

    def set_survey_type
      @survey_type = SurveyType.find(params[:id])
    end

    def survey_type_params
      params.require(:survey_type).permit(:name)
    end
end
