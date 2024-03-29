class ContentsController < ApplicationController
  
  before_action :admin_user
  before_action :set_content, only: [:show, :edit, :update, :destroy]

  def index
    @contents = Content.search(params[:search]).paginate(page: params[:page]).order('name ASC')
  end

  def create
    @content = Content.new(content_params)

    if @content.save
      flash[:success] = "Content created successfully"
      redirect_to contents_url
    else
      render 'new'
    end
  end

  def destroy
    if @content.destroy
      flash[:success] = "Content deleted"
      redirect_to contents_url
    else
      flash[:danger] = "Deletion failed! This Content is being used by another object and cannot be deleted."
      redirect_to @content
    end
  end

  def edit
  end

  def new
    @content = Content.new
  end

  def show
  end

  def update
    if @content.update_attributes(content_params)
      flash[:success] = "Content updated"
      redirect_to @content
    else
      render 'edit'
    end
  end

  private

    def set_content
      @content = Content.find(params[:id])
    end

    def content_params
      params.require(:content).permit(:name, :content, :language_id, :content_location_id, :election_id)
    end
end
