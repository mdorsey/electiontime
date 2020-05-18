class ComparisonPagesController < ApplicationController

  before_action :set_election, only: [:election_summary, :compare_candidates, :compare_party_leaders, :compare_party_platforms]

  def find_my_election
    @elections = Election.where(active: true).order('election_date DESC')
  end

  def election_summary
  end

  def compare_candidates
    @district = District.find(params[:district_id])
  end

  def compare_party_leaders
  end

  def compare_party_platforms
  end

  private

    def set_election
      @election = Election.find(params[:election_id])
    end
end
