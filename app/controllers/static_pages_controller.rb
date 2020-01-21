class StaticPagesController < ApplicationController

  def about
    @content_location = ContentLocation.find_by(name: "page_about_main")
    if @content_location
      @content_main = Content.find_by(content_location_id: @content_location.id)
    end
  end

  def contact
    @content_location = ContentLocation.find_by(name: "page_contact_main")
    if @content_location
      @content_main = Content.find_by(content_location_id: @content_location.id)
    end
  end

  def home
    @content_location = ContentLocation.find_by(name: "page_home_main")
    if @content_location
      @content_main = Content.find_by(content_location_id: @content_location.id)
    end
  end

  def volunteer
    @content_location = ContentLocation.find_by(name: "page_volunteer_main")
    if @content_location
      @content_main = Content.find_by(content_location_id: @content_location.id)
    end
  end
end
