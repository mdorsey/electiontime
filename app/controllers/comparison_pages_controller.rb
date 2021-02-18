class ComparisonPagesController < ApplicationController

  before_action :set_election, only: [:election_summary, :compare_candidates, :compare_party_leaders, :compare_party_platforms]
  before_action :set_office_district, only: [:compare_candidates]

  # Breadcrumbs
  breadcrumb 'Find My Election', :find_my_election_path
  breadcrumb -> { @election.name }, -> { election_summary_path(@election) }, only: [:election_summary, :compare_candidates, :compare_party_leaders, :compare_party_platforms]
  breadcrumb -> { @office.name + ' for ' + @district.name }, -> { compare_candidates_path(election_id: @election.id, office_id: @office.id, district_id: @district.id) }, only: [:compare_candidates]
  breadcrumb 'Compare Party Leaders', -> { compare_party_leaders_path(@election) }, only: [:compare_party_leaders]
  breadcrumb 'Compare Party Platforms', -> { compare_party_platforms_path(@election) }, only: [:compare_party_platforms]

  def find_my_election
    @elections_future = Election.where("active = true AND election_date >= ?", Time.now.utc.midnight).order('election_date ASC')
    @elections_past = Election.where("active = true AND election_date < ?", Time.now.utc.midnight).order('election_date DESC')
  end

  def election_summary

    if @election.compare_parties
      @parties = @election.parties_for_display
    end

    if @election.compare_party_leaders
      @party_leaders = @election.party_leaders_for_display
    end

    # Election-specific content - top of the page
    @content_location_top = ContentLocation.find_by(name: "page_election_summary_location_top")
    if @content_location_top
      @content_top = Content.find_by(content_location_id: @content_location_top.id, election_id: @election.id)
    end

    # Election-specific content - bottom of the page
    @content_location_bottom = ContentLocation.find_by(name: "page_election_summary_location_bottom")
    if @content_location_bottom
      @content_bottom = Content.find_by(content_location_id: @content_location_bottom.id, election_id: @election.id)
    end

    # If the Compare Candidates submit button has been clicked
    if (params[:office_id] && Office.find(params[:office_id]) && params[:district_id] && District.find(params[:district_id]))
      redirect_to compare_candidates_path(election_id: @election.id, office_id: params[:office_id], district_id: params[:district_id])
    end
  end

  def compare_candidates
    @candidates = @election.candidates_for_display(@office.id, @district.id)
    @survey_questions = @election.survey_questions_by_type("Candidate")
  end

  def compare_party_leaders
    @party_leaders = @election.party_leaders_for_display
    @survey_questions = @election.survey_questions_by_type("Candidate")
  end

  def compare_party_platforms
    @parties = @election.parties_for_display
    @survey_questions = @election.survey_questions_by_type("Party")
  end

  private

    def set_election
      @election = Election.find(params[:election_id])
    end

    def set_office_district
      @office = Office.find(params[:office_id])
      @district = District.find(params[:district_id])
    end
end
