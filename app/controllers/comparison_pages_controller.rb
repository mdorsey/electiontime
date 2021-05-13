class ComparisonPagesController < ApplicationController

  before_action :set_election, only: [:election_summary, :compare_candidates, :compare_candidates_in_district, :compare_party_leaders, :compare_party_platforms]
  before_action :set_office, only: [:compare_candidates, :compare_candidates_in_district]
  before_action :set_district, only: [:compare_candidates_in_district]
  before_action :set_empty_profile_text, only: [:compare_candidates, :compare_candidates_in_district, :compare_party_leaders, :compare_party_platforms]

  # Breadcrumbs
  breadcrumb -> { @election.name }, -> { election_summary_path(@election.slug) }, only: [:election_summary, :compare_candidates, :compare_candidates_in_district, :compare_party_leaders, :compare_party_platforms]
  breadcrumb -> { 'Candidates for ' + @office.name }, -> { compare_candidates_path(election_slug: @election.slug, office_id: @office.id) }, only: [:compare_candidates]
  breadcrumb -> { 'Candidates for ' + @office.name + ' in ' + @district.name }, -> { compare_candidates_in_district_path(election_slug: @election.slug, office_id: @office.id, district_id: @district.id) }, only: [:compare_candidates_in_district]
  breadcrumb 'Party Leaders', -> { compare_party_leaders_path(@election.slug) }, only: [:compare_party_leaders]
  breadcrumb 'Party Platforms', -> { compare_party_platforms_path(@election.slug) }, only: [:compare_party_platforms]

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

    # If the District submit button has been clicked
    if (params[:office_id] && Office.find(params[:office_id]) && params[:district_id] && District.find(params[:district_id]))
      redirect_to compare_candidates_in_district_path(election_slug: @election.slug, office_id: params[:office_id], district_id: params[:district_id])
    end
  end

  def compare_candidates
    @candidates = @election.candidates_for_display(@office.id)
    @survey_questions = @election.survey_questions_by_type("Candidate")
  end

  def compare_candidates_in_district
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

  def participant_contact_click
    @participant = Participant.find_by(id: params[:participant_id])
    if @participant && params[:location]
      Log.create(log_type_id: LogType.find_by(name: "Contact Participant").id, message: "Anonymous user is contacting the participant " + @participant.name + " [id: " + @participant.id.to_s + "]", location: params[:location])
    end
  end

  private

    def set_election
      @election = Election.find_by(slug: params[:election_slug])
    end

    def set_office
      @office = Office.find(params[:office_id])
    end

    def set_district
      @district = District.find(params[:district_id])
    end

    def set_empty_profile_text
      @content_location = ContentLocation.find_by(name: "empty_profile_text")
      if @content_location
        @content_empty_profile_text = Content.find_by(content_location_id: @content_location.id)
      end
    end
end
