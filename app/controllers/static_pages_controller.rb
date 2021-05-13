class StaticPagesController < ApplicationController

  # Breadcrumbs
  breadcrumb 'About', :about_path, only: [:about]
  breadcrumb 'Contact', :contact_path, only: [:contact]

  def about
    @content_location = ContentLocation.find_by(name: "page_about_location_main")
    if @content_location
      @content_main = Content.find_by(content_location_id: @content_location.id)
    end
  end

  def contact
    @content_location = ContentLocation.find_by(name: "page_contact_location_main")
    if @content_location
      @content_main = Content.find_by(content_location_id: @content_location.id)
    end
  end

  def home
    @content_location_banner = ContentLocation.find_by(name: "page_home_location_banner")
    if @content_location_banner
      @content_banner = Content.find_by(content_location_id: @content_location_banner.id)
    end

    @content_location_about = ContentLocation.find_by(name: "page_home_location_about")
    if @content_location_about
      @content_about = Content.find_by(content_location_id: @content_location_about.id)
    end

    @elections_future = Election.where("active = true AND election_date >= ?", Time.now.utc.midnight).order('election_date ASC')
    @elections_past = Election.where("active = true AND election_date < ?", Time.now.utc.midnight).order('election_date DESC')
  end
end
