class LanguagesController < ApplicationController

  before_action :admin_user
  before_action :set_language, only: [:show, :edit, :update, :destroy]

  def index
    @languages = Language.paginate(page: params[:page]).order('name ASC')
  end

  def create
    @language = Language.new(language_params)

    if @language.save
      flash[:info] = "Language created successfully"
      redirect_to languages_url
    else
      render 'new'
    end
  end

  def destroy
    if @language.destroy
      flash[:success] = "Language deleted"
      redirect_to languages_url
    else
      flash[:danger] = "Deletion failed! This Language is being used by another object and cannot be deleted."
      redirect_to @language
    end
  end

  def edit
  end

  def new
    @language = Language.new
  end

  def show
  end

  def update
    if @language.update_attributes(language_params)
      flash[:success] = "Language updated"
      redirect_to @language
    else
      render 'edit'
    end
  end

  private

    def set_language
      @language = Language.find(params[:id])
    end

    def language_params
      params.require(:language).permit(:name)
    end
end
