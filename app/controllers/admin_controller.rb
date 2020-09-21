class AdminController < ApplicationController
  
  def dashboard
  end

  def import_districts
    @count = 0
    @errors = Array.new
  end

  def import_districts_submit
    @count, @errors = District.import(params[:file], params[:election_id], params[:jurisdiction_id], params[:overwrite])
    render 'import_districts'
  end
end
