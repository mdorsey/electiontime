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
    @content_location = ContentLocation.find_by(name: "page_home_location_main")
    if @content_location
      @content_main = Content.find_by(content_location_id: @content_location.id)
    end
  end
end
