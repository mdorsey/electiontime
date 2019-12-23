class StaticPagesController < ApplicationController

  def about
    @content_main = Content.find_by(machine_name: 'page_about_main')
  end

  def contact
    @content_main = Content.find_by(machine_name: 'page_contact_main')
  end

  def home
    @content_main = Content.find_by(machine_name: 'page_home_main')
  end

  def volunteer
    @content_main = Content.find_by(machine_name: 'page_volunteer_main')
  end
end
