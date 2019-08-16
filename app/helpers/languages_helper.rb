module LanguagesHelper

  def display_language(language_id)
    return Language.find(language_id).name
  end

  def options_for_language
    languages = Array.new

    Language.all.order('name ASC').each do |j|
      languages.push([j.name, j.id])
    end

    return languages
  end
end
