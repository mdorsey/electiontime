class ComparisonPagesController < ApplicationController

  before_action :set_election, only: [:election_summary, :compare_candidates, :compare_party_leaders, :compare_party_platforms]
  before_action :set_district, only: [:compare_candidates]

  # Breadcrumbs
  breadcrumb 'Find My Election', :find_my_election_path
  breadcrumb -> { @election.name }, -> { election_summary_path(@election) }, only: [:election_summary, :compare_candidates, :compare_party_leaders, :compare_party_platforms]
  breadcrumb -> { @district.name }, -> { compare_candidates_path(election_id: @election.id, district_id: @district.id) }, only: [:compare_candidates]
  breadcrumb 'Compare Party Leaders', -> { compare_party_leaders_path(@election) }, only: [:compare_party_leaders]
  breadcrumb 'Compare Party Platforms', -> { compare_party_platforms_path(@election) }, only: [:compare_party_platforms]

  def find_my_election
    @elections = Election.where(active: true).order('election_date DESC')
  end

  def election_summary
    # If the Compare Candidates submit button has been clicked
    if (params[:district_id] && District.find(params[:district_id]))
      redirect_to compare_candidates_path(election_id: @election.id, district_id: params[:district_id])
    end
  end

  def compare_candidates
  end

  def compare_party_leaders
  end

  def compare_party_platforms
  end

  private

    def set_election
      @election = Election.find(params[:election_id])

      # Get the parties and leaders associated with this election
      @participant_parties = @election.participants.where(is_candidate: false)
      @participant_party_leaders = []
      @participant_parties.each do |party|
        leader = Participant.find(party.leader_participant_id)
        @participant_party_leaders << leader
      end
    end

    def set_district
      @district = District.find(params[:district_id])
    end
end
