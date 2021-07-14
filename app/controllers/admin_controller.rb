class AdminController < ApplicationController
  
  before_action :admin_user
  
  def dashboard
    @elections_active = Election.where(active: true).count
  end

  def import_districts
    @errors = Array.new
    @new_districts_count = 0
    @success_message = ''
  end

  def import_districts_submit
    @errors, @new_offices_count, @new_districts_count = District.import(params[:file], params[:election_id], params[:overwrite])
    @success_message = "Success! #{@new_offices_count} " + 'office'.pluralize(@new_offices_count) + " and #{@new_districts_count} " + 'district'.pluralize(@new_districts_count) + " were created."
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
