class StaticPagesController < ApplicationController

  def home
    @content_location_banner = ContentLocation.find_by(name: "page_home_location_banner")
    if @content_location_banner
      @content_banner = Content.find_by(content_location_id: @content_location_banner.id)
    end

    @content_location_no_upcoming_elections = ContentLocation.find_by(name: "page_home_location_no_upcoming_elections")
    if @content_location_no_upcoming_elections
      @content_no_upcoming_elections = Content.find_by(content_location_id: @content_location_no_upcoming_elections.id)
    end

    @content_location_about = ContentLocation.find_by(name: "page_home_location_about")
    if @content_location_about
      @content_about = Content.find_by(content_location_id: @content_location_about.id)
    end

    @content_location_contact = ContentLocation.find_by(name: "page_home_location_contact")
    if @content_location_contact
      @content_contact = Content.find_by(content_location_id: @content_location_contact.id)
    end

    @elections_future = Election.where("active = true AND election_date >= ?", Time.now.utc.midnight).order('election_date ASC')
    @elections_past = Election.where("active = true AND election_date < ?", Time.now.utc.midnight).order('election_date DESC')
  end
end
