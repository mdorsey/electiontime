module ApplicationHelper

  # Returns the full title on a per-page basis.
  def full_title(page_title = '')
    base_title = "Election Time"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def display_boolean_as_yes_or_no(bool)
    if bool
      "Yes"
    else
      "No"
    end
  end

end
