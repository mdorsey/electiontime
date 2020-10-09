module AdminHelper
  def options_for_import_participants_data_source
    options = Array.new
    options.push(["Candidates", "Candidates"])
    options.push(["Parties and Party Leaders", "Parties and Party Leaders"])
    return options
  end
end
