class AdminController < ApplicationController
  
  def dashboard
  end

  def import_districts
    @errors = Array.new
    @new_districts_count = 0
    @success_message = ''
  end

  def import_districts_submit
    @errors, @new_districts_count = District.import(params[:file], params[:election_id], params[:jurisdiction_id], params[:overwrite])
    @success_message = "Success! #{@new_districts_count} " + 'row'.pluralize(@new_districts_count) + " were imported."
    render 'import_districts'
  end

  def import_participants
    @errors = Array.new
    @new_users_count = 0
    @new_participants_count = 0
    @success_message = ''
  end

  def import_participants_submit
    @errors, @new_users_count, @new_participants_count = Participant.import(params[:file], params[:election_id], params[:overwrite])
    @success_message = "Success! #{@new_participants_count} " + 'row'.pluralize(@new_participants_count) + " were imported, and #{@new_users_count} " + 'user'.pluralize(@new_users_count) + " were created."
    render 'import_participants'
  end
end
