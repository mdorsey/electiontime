# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ContentLocation.create!(name: "page_home_location_banner")
ContentLocation.create!(name: "page_home_location_no_upcoming_elections")
ContentLocation.create!(name: "page_home_location_about")
ContentLocation.create!(name: "page_home_location_contact")
ContentLocation.create!(name: "page_election_summary_location_top")
ContentLocation.create!(name: "page_election_summary_location_bottom")
ContentLocation.create!(name: "empty_profile_text")
ContentLocation.create!(name: "email_welcome_subject")
ContentLocation.create!(name: "email_welcome_body")
ContentLocation.create!(name: "email_password_reset_subject")
ContentLocation.create!(name: "email_password_reset_body")
ContentLocation.create!(name: "footer_fine_print")

ElectionType.create!(name: "Federal")
ElectionType.create!(name: "Provincial")
ElectionType.create!(name: "Municipal")

Jurisdiction.create!(name: "Canada")
Jurisdiction.create!(name: "Alberta")
Jurisdiction.create!(name: "British Columbia")
Jurisdiction.create!(name: "Manitoba")
Jurisdiction.create!(name: "New Brunswick")
Jurisdiction.create!(name: "Newfoundland and Labrador")
Jurisdiction.create!(name: "Northwest Territories")
Jurisdiction.create!(name: "Nova Scotia")
Jurisdiction.create!(name: "Nunavut")
Jurisdiction.create!(name: "Ontario")
Jurisdiction.create!(name: "Prince Edward Island")
Jurisdiction.create!(name: "Quebec")
Jurisdiction.create!(name: "Saskatchewan")
Jurisdiction.create!(name: "Yukon")

Language.create!(name: "English")

LogType.create!(name: "Account Settings")
LogType.create!(name: "Contact Participant")
LogType.create!(name: "Email Sent")
LogType.create!(name: "Public Profile")
LogType.create!(name: "Session")

Party.create!(name: "Independent")

social_media_type_1 = SocialMediaType.create!(name: "Facebook", website: "https://www.facebook.com/", icon: "fab fa-facebook-square fa-lg")
social_media_type_2 = SocialMediaType.create!(name: "Instagram", website: "https://www.instagram.com/", icon: "fab fa-instagram-square fa-lg")
social_media_type_3 = SocialMediaType.create!(name: "LinkedIn", website: "https://www.linkedin.com/in/", icon: "fab fa-linkedin fa-lg")
social_media_type_4 = SocialMediaType.create!(name: "Medium", website: "https://medium.com/", icon: "fab fa-medium fa-lg")
social_media_type_5 = SocialMediaType.create!(name: "Twitter", website: "https://twitter.com/", icon: "fab fa-twitter-square fa-lg")
social_media_type_6 = SocialMediaType.create!(name: "Youtube", website: "https://www.youtube.com/", icon: "fab fa-youtube-square fa-lg")

SurveyType.create!(name: "Candidate")
SurveyType.create!(name: "Party")

SystemSetting.create!(name: "biography_max_character_length", setting: "1000")
SystemSetting.create!(name: "blank_avatar_name", setting: "blank_avatar.png")
SystemSetting.create!(name: "survey_answer_max_character_length", setting: "1000")

UserType.create!(name: "Admin")
UserType.create!(name: "Volunteer")
UserType.create!(name: "Candidate")
UserType.create!(name: "Party Representative")

# Initialize the webmaster account
User.create!(first_name:  "Webmaster",
             last_name: "Webmaster",
             email: "webmaster@electiontime.org",
             user_type_id: UserType.find_by(name: 'Admin').id,
             password: "webmasteraccount",
             password_confirmation: "webmasteraccount",
             activated: true,
             activated_at: Time.zone.now)


# -----------------------------------------------------
# TEMPORARY FAKE DATA FOR TESTING PURPOSES
# -----------------------------------------------------

# Party.create!(name: "Liberal Party of Canada", name_abbreviation: "Liberal", alternate_name: "Parti libéral du Canada", alternate_abbreviation: "Libéral")
# Party.create!(name: "People's Party of Canada", name_abbreviation: "PPC", alternate_name: "Parti populaire du Canada", alternate_abbreviation: "PPC")
# Party.create!(name: "Conservative Party of Canada", name_abbreviation: "Conservative", alternate_name: "Parti conservateur du Canada", alternate_abbreviation: "Conservateur")
# Party.create!(name: "New Democratic Party", name_abbreviation: "NDP", alternate_name: "Nouveau Parti démocratique", alternate_abbreviation: "NPD")
# Party.create!(name: "Bloc Québécois", name_abbreviation: "BQ")
# Party.create!(name: "Green Party of Canada", name_abbreviation: "Green", alternate_name: "Parti vert du Canada", alternate_abbreviation: "Vert")

# current_election = Election.create!(name: "Canadian Federal Election",
#                                     election_date: DateTime.new(2021, 10, 21),
#                                     election_type_id: ElectionType.find_by(name: "Federal").id,
#                                     jurisdiction_id: Jurisdiction.find_by(name: "Canada").id,
#                                     active: true,
#                                     compare_parties: true,
#                                     compare_party_leaders: true)

# current_office = Office.create!(name: "Parliament", order: 1, election_id: current_election.id)

# District.create!(name: "Abbotsford", office_id: current_office.id)
# District.create!(name: "Abitibi—Baie-James--Nunavik--Eeyou", office_id: current_office.id)
# District.create!(name: "Abitibi—Témiscamingue", office_id: current_office.id)
# District.create!(name: "Acadie—Bathurst", office_id: current_office.id)
# District.create!(name: "Ahuntsic-Cartierville", office_id: current_office.id)
# District.create!(name: "Ajax", office_id: current_office.id)
# District.create!(name: "Alfred-Pellan", office_id: current_office.id)
# District.create!(name: "Algoma—Manitoulin--Kapuskasing", office_id: current_office.id)
# District.create!(name: "Argenteuil--La Petite-Nation", office_id: current_office.id)
# District.create!(name: "Aurora--Oak Ridges--Richmond Hill", office_id: current_office.id)
# District.create!(name: "Avalon", office_id: current_office.id)
# District.create!(name: "Avignon--La Mitis—Matane--Matapédia", office_id: current_office.id)
# District.create!(name: "Banff—Airdrie", office_id: current_office.id)
# District.create!(name: "Barrie—Innisfil", office_id: current_office.id)
# District.create!(name: "Barrie—Springwater--Oro-Medonte",  office_id: current_office.id)
# District.create!(name: "Battle River—Crowfoot", office_id: current_office.id)
# District.create!(name: "Battlefords—Lloydminster", office_id: current_office.id)
# District.create!(name: "Bay of Quinte",  office_id: current_office.id)
# District.create!(name: "Burlington",  office_id: current_office.id)
# District.create!(name: "Burnaby North—Seymour",  office_id: current_office.id)
# District.create!(name: "Burnaby South",  office_id: current_office.id)
# District.create!(name: "Bécancour—Nicolet--Saurel",  office_id: current_office.id)
# District.create!(name: "Calgary Centre",  office_id: current_office.id)
# District.create!(name: "Calgary Confederation",  office_id: current_office.id)
# District.create!(name: "Calgary Forest Lawn",  office_id: current_office.id)
# District.create!(name: "Calgary Heritage",  office_id: current_office.id)
# District.create!(name: "Calgary Midnapore",  office_id: current_office.id)
# District.create!(name: "Calgary Nose Hill",  office_id: current_office.id)
# District.create!(name: "Calgary Rocky Ridge",  office_id: current_office.id)
# District.create!(name: "Calgary Shepard",  office_id: current_office.id)
# District.create!(name: "Calgary Signal Hill",  office_id: current_office.id)
# District.create!(name: "Calgary Skyview",  office_id: current_office.id)
# District.create!(name: "Cambridge",  office_id: current_office.id)
# District.create!(name: "Cape Breton—Canso",  office_id: current_office.id)
# District.create!(name: "Cardigan",  office_id: current_office.id)
# District.create!(name: "Cariboo--Prince George",  office_id: current_office.id)
# District.create!(name: "Davenport",  office_id: current_office.id)
# District.create!(name: "Delta",  office_id: current_office.id)
# District.create!(name: "Desnethé--Missinippi--Churchill River",  office_id: current_office.id)
# District.create!(name: "Don Valley East",  office_id: current_office.id)
# District.create!(name: "Don Valley North",  office_id: current_office.id)
# District.create!(name: "Don Valley West",  office_id: current_office.id)
# District.create!(name: "Dorval--Lachine--LaSalle",  office_id: current_office.id)
# District.create!(name: "Drummond",  office_id: current_office.id)
# District.create!(name: "Dufferin--Caledon",  office_id: current_office.id)
# District.create!(name: "Durham",  office_id: current_office.id)
# District.create!(name: "Edmonton Centre",  office_id: current_office.id)
# District.create!(name: "Edmonton Griesbach",  office_id: current_office.id)
# District.create!(name: "Edmonton Manning",  office_id: current_office.id)
# District.create!(name: "Edmonton Mill Woods",  office_id: current_office.id)
# District.create!(name: "Edmonton Riverbend",  office_id: current_office.id)
# District.create!(name: "Edmonton Strathcona",  office_id: current_office.id)
# District.create!(name: "Edmonton West",  office_id: current_office.id)
# District.create!(name: "Edmonton--Wetaskiwin",  office_id: current_office.id)
# District.create!(name: "Gaspésie--Les Îles-de-la-Madeleine",  office_id: current_office.id)
# District.create!(name: "Gatineau",  office_id: current_office.id)
# District.create!(name: "Glengarry--Prescott--Russell",  office_id: current_office.id)
# District.create!(name: "Grande Prairie--Mackenzie",  office_id: current_office.id)
# District.create!(name: "Guelph",  office_id: current_office.id)
# District.create!(name: "Haldimand--Norfolk",  office_id: current_office.id)
# District.create!(name: "Haliburton--Kawartha Lakes--Brock",  office_id: current_office.id)
# District.create!(name: "Halifax",  office_id: current_office.id)
# District.create!(name: "Halifax West",  office_id: current_office.id)
# District.create!(name: "Hamilton Centre",  office_id: current_office.id)
# District.create!(name: "Hamilton East--Stoney Creek",  office_id: current_office.id)
# District.create!(name: "Hamilton Mountain",  office_id: current_office.id)
# District.create!(name: "Hamilton West--Ancaster--Dundas",  office_id: current_office.id)
# District.create!(name: "Hastings--Lennox and Addington",  office_id: current_office.id)
# District.create!(name: "Hochelaga",  office_id: current_office.id)
# District.create!(name: "Honoré-Mercier",  office_id: current_office.id)
# District.create!(name: "Hull--Aylmer",  office_id: current_office.id)
# District.create!(name: "Humber River--Black Creek",  office_id: current_office.id)
# District.create!(name: "Huron--Bruce",  office_id: current_office.id)
# District.create!(name: "Joliette",  office_id: current_office.id)
# District.create!(name: "Jonquière",  office_id: current_office.id)
# District.create!(name: "La Prairie",  office_id: current_office.id)
# District.create!(name: "Labrador",  office_id: current_office.id)
# District.create!(name: "Lac-Saint-Jean",  office_id: current_office.id)
# District.create!(name: "Lac-Saint-Louis",  office_id: current_office.id)
# District.create!(name: "Lakeland",  office_id: current_office.id)
# District.create!(name: "Lambton--Kent--Middlesex",  office_id: current_office.id)
# District.create!(name: "Lanark--Frontenac--Kingston",  office_id: current_office.id)
# District.create!(name: "Langley--Aldergrove",  office_id: current_office.id)
# District.create!(name: "LaSalle--Émard--Verdun",  office_id: current_office.id)
# District.create!(name: "Laurentides--Labelle",  office_id: current_office.id)
# District.create!(name: "Laurier--Sainte-Marie",  office_id: current_office.id)
# District.create!(name: "Laval--Les Îles",  office_id: current_office.id)
# District.create!(name: "Leeds-Grenville-Thousand Islands and Rideau Lakes",  office_id: current_office.id)
# District.create!(name: "Lethbridge",  office_id: current_office.id)
# District.create!(name: "London--Fanshawe",  office_id: current_office.id)
# District.create!(name: "London North Centre",  office_id: current_office.id)
# District.create!(name: "London West",  office_id: current_office.id)
# District.create!(name: "Long Range Mountains",  office_id: current_office.id)
# District.create!(name: "Longueuil--Charles-LeMoyne",  office_id: current_office.id)
# District.create!(name: "Longueuil--Saint-Hubert",  office_id: current_office.id)
# District.create!(name: "Louis-Hébert",  office_id: current_office.id)
# District.create!(name: "Louis-Saint-Laurent",  office_id: current_office.id)
# District.create!(name: "Lévis--Lotbinière",  office_id: current_office.id)
# District.create!(name: "Nanaimo--Ladysmith",  office_id: current_office.id)
# District.create!(name: "Nepean",  office_id: current_office.id)
# District.create!(name: "New Brunswick Southwest",  office_id: current_office.id)
# District.create!(name: "New Westminster--Burnaby",  office_id: current_office.id)
# District.create!(name: "Newmarket--Aurora",  office_id: current_office.id)
# District.create!(name: "Niagara Centre",  office_id: current_office.id)
# District.create!(name: "Niagara Falls",  office_id: current_office.id)
# District.create!(name: "Niagara West",  office_id: current_office.id)
# District.create!(name: "Nickel Belt",  office_id: current_office.id)
# District.create!(name: "Nipissing--Timiskaming",  office_id: current_office.id)
# District.create!(name: "North Island--Powell River",  office_id: current_office.id)
# District.create!(name: "North Okanagan--Shuswap",  office_id: current_office.id)
# District.create!(name: "North Vancouver",  office_id: current_office.id)
# District.create!(name: "Northumberland--Peterborough South",  office_id: current_office.id)
# District.create!(name: "Northwest Territories",  office_id: current_office.id)
# District.create!(name: "Notre-Dame-de-Grâce--Westmount",  office_id: current_office.id)
# District.create!(name: "Nunavut", office_id: current_office.id)
# District.create!(name: "Oakville",  office_id: current_office.id)
# District.create!(name: "Oakville North--Burlington",  office_id: current_office.id)
# District.create!(name: "Orléans",  office_id: current_office.id)
# District.create!(name: "Oshawa",  office_id: current_office.id)
# District.create!(name: "Ottawa Centre",  office_id: current_office.id)
# District.create!(name: "Ottawa South",  office_id: current_office.id)
# District.create!(name: "Ottawa--Vanier",  office_id: current_office.id)
# District.create!(name: "Ottawa West--Nepean",  office_id: current_office.id)
# District.create!(name: "Outremont",  office_id: current_office.id)
# District.create!(name: "Oxford",  office_id: current_office.id)
# District.create!(name: "Québec",  office_id: current_office.id)
# District.create!(name: "Red Deer--Lacombe",  office_id: current_office.id)
# District.create!(name: "Red Deer--Mountain View",  office_id: current_office.id)
# District.create!(name: "Regina--Lewvan",  office_id: current_office.id)
# District.create!(name: "Regina--Qu'Appelle",  office_id: current_office.id)
# District.create!(name: "Regina--Wascana",  office_id: current_office.id)
# District.create!(name: "Renfrew--Nipissing--Pembroke",  office_id: current_office.id)
# District.create!(name: "Repentigny",  office_id: current_office.id)
# District.create!(name: "Richmond--Arthabaska",  office_id: current_office.id)
# District.create!(name: "Richmond Centre",  office_id: current_office.id)
# District.create!(name: "Richmond Hill",  office_id: current_office.id)
# District.create!(name: "Rimouski-Neigette--Témiscouata--Les Basques",  office_id: current_office.id)
# District.create!(name: "Rivière-des-Mille-Îles",  office_id: current_office.id)
# District.create!(name: "Rivière-du-Nord",  office_id: current_office.id)
# District.create!(name: "Rosemont--La Petite-Patrie",  office_id: current_office.id)
# District.create!(name: "Terrebonne",  office_id: current_office.id)
# District.create!(name: "Thornhill",  office_id: current_office.id)
# District.create!(name: "Thunder Bay--Rainy River",  office_id: current_office.id)
# District.create!(name: "Thunder Bay--Superior North",  office_id: current_office.id)
# District.create!(name: "Thérèse-De Blainville",  office_id: current_office.id)
# District.create!(name: "Timmins--James Bay",  office_id: current_office.id)
# District.create!(name: "Tobique--Mactaquac",  office_id: current_office.id)
# District.create!(name: "Toronto Centre",  office_id: current_office.id)
# District.create!(name: "Toronto--Danforth",  office_id: current_office.id)
# District.create!(name: "Toronto--St. Paul's",  office_id: current_office.id)
# District.create!(name: "Trois-Rivières",  office_id: current_office.id)
# District.create!(name: "University--Rosedale",  office_id: current_office.id)
# District.create!(name: "Vancouver Centre",  office_id: current_office.id)
# District.create!(name: "Vancouver East",  office_id: current_office.id)
# District.create!(name: "Vancouver Granville",  office_id: current_office.id)
# District.create!(name: "Vancouver Kingsway",  office_id: current_office.id)
# District.create!(name: "Vancouver Quadra",  office_id: current_office.id)
# District.create!(name: "Vancouver South",  office_id: current_office.id)
# District.create!(name: "Vaudreuil--Soulanges",  office_id: current_office.id)
# District.create!(name: "Vaughan--Woodbridge",  office_id: current_office.id)
# District.create!(name: "Victoria",  office_id: current_office.id)
# District.create!(name: "Ville-Marie--Le Sud-Ouest--Île-des-Soeurs",  office_id: current_office.id)
# District.create!(name: "Vimy",  office_id: current_office.id)
# District.create!(name: "Yellowhead",  office_id: current_office.id)
# District.create!(name: "York Centre",  office_id: current_office.id)
# District.create!(name: "York--Simcoe",  office_id: current_office.id)
# District.create!(name: "York South--Weston",  office_id: current_office.id)
# District.create!(name: "Yorkton--Melville",  office_id: current_office.id)
# District.create!(name: "Yukon", office_id: current_office.id)

# avatar_id = 1

# District.all.each do |district|

#   Party.all.each do |party|

#     first_name = Faker::Name.first_name
#     last_name = Faker::Name.last_name
#     email = Faker::Internet.email
#     biography = Faker::Lorem.paragraph(sentence_count: 20, supplemental: true, random_sentences_to_add: 10)
#     phone = Faker::PhoneNumber.phone_number
#     address = Faker::Address.full_address
#     website = Faker::Internet.url

#     current_user = User.create!(first_name: first_name,
#                                 last_name: last_name,             
#                                 email: email,
#                                 user_type_id: UserType.find_by(name: 'Candidate').id,
#                                 password: "password",
#                                 password_confirmation: "password",
#                                 activated: true,
#                                 activated_at: Time.zone.now)
    
#     candidate = Participant.create!(user_id: current_user.id,
#                                     is_candidate: true,
#                                     is_incumbent: false,
#                                     is_party_leader: false,
#                                     office_id: current_office.id,
#                                     district_id: district.id,
#                                     party_id: party.id,
#                                     name: current_user.first_name + " " + current_user.last_name,
#                                     email: current_user.email,
#                                     website: website,
#                                     phone: phone,
#                                     address: address,
#                                     biography: biography)

#     candidate.picture.attach(io: File.open('/home/michael/vote_app/vote_app/app/assets/images/seed_avatar' + avatar_id.to_s + '.png'), filename: 'seed_avatar' + avatar_id.to_s + '.png')
#     avatar_id += 1
#     if avatar_id === 6
#       avatar_id = 1
#     end

#     if (avatar_id < 3)
#       SocialMediaProfile.create!(handle: first_name, participant_id: candidate.id, social_media_type_id: social_media_type_1.id)
#       SocialMediaProfile.create!(handle: first_name, participant_id: candidate.id, social_media_type_id: social_media_type_2.id)
#       SocialMediaProfile.create!(handle: first_name, participant_id: candidate.id, social_media_type_id: social_media_type_3.id)
#     else
#       SocialMediaProfile.create!(handle: first_name, participant_id: candidate.id, social_media_type_id: social_media_type_4.id)
#       SocialMediaProfile.create!(handle: first_name, participant_id: candidate.id, social_media_type_id: social_media_type_5.id)
#       SocialMediaProfile.create!(handle: first_name, participant_id: candidate.id, social_media_type_id: social_media_type_6.id)
#     end
#   end
# end

# # Create the party participants and set the party leader
# Party.where.not(name: "Independent").each do |party|

#   party_member = Participant.where(party_id: party.id).first
#   party_member.update(is_party_leader: true)

#   phone = Faker::PhoneNumber.phone_number
#   address = Faker::Address.full_address
#   website = Faker::Internet.url
#   email = Faker::Internet.email
#   biography = Faker::Lorem.paragraph(sentence_count: 20, supplemental: true, random_sentences_to_add: 10)

#   party_participant = Participant.create!(user_id: party_member.id,
#                                           is_candidate: false,
#                                           is_incumbent: false,
#                                           is_party_leader: false,
#                                           party_id: party.id,
#                                           name: party.name,
#                                           email: email,
#                                           website: website,
#                                           phone: phone,
#                                           address: address,
#                                           biography: biography)

#   party_participant.picture.attach(io: File.open('/home/michael/vote_app/vote_app/app/assets/images/seed_avatar' + avatar_id.to_s + '.png'), filename: 'seed_avatar' + avatar_id.to_s + '.png')
#   avatar_id += 1
#   if avatar_id === 6
#     avatar_id = 1
#   end

#   if (avatar_id < 3)
#     SocialMediaProfile.create!(handle: email, participant_id: party_participant.id, social_media_type_id: social_media_type_1.id)
#     SocialMediaProfile.create!(handle: email, participant_id: party_participant.id, social_media_type_id: social_media_type_2.id)
#     SocialMediaProfile.create!(handle: email, participant_id: party_participant.id, social_media_type_id: social_media_type_3.id)
#   else
#     SocialMediaProfile.create!(handle: email, participant_id: party_participant.id, social_media_type_id: social_media_type_4.id)
#     SocialMediaProfile.create!(handle: email, participant_id: party_participant.id, social_media_type_id: social_media_type_5.id)
#     SocialMediaProfile.create!(handle: email, participant_id: party_participant.id, social_media_type_id: social_media_type_6.id)
#   end
# end

# # Add all participants to the current election
# current_election.participants = Participant.all

# # Create the surveys
# survey_candidate = Survey.create!(name: "Canadian Federal Election - Candidate", survey_type_id: SurveyType.find_by(name: 'Candidate').id, election_id: current_election.id)
# survey_party = Survey.create!(name: "Canadian Federal Election - Party", survey_type_id: SurveyType.find_by(name: 'Party').id, election_id: current_election.id)

# candidate_question_1 = SurveyQuestion.create!(survey_id: survey_candidate.id, topic: "Climate change", question: "What is your plan to combat climate change?", order: 1)
# candidate_question_2 = SurveyQuestion.create!(survey_id: survey_candidate.id, topic: "COVID-19", question: "What is your plan for managing the coronavirus?", order: 2)
# candidate_question_3 = SurveyQuestion.create!(survey_id: survey_candidate.id, topic: "Local issues", question: "What is the most important issue for the people of your district? And how are you planning to address it?", order: 3)

# party_question_1 = SurveyQuestion.create!(survey_id: survey_party.id, topic: "Climate change", question: "What is your plan to combat climate change?", order: 1)
# party_question_2 = SurveyQuestion.create!(survey_id: survey_party.id, topic: "COVID-19", question: "What is your plan for managing the coronavirus?", order: 2)
# party_question_3 = SurveyQuestion.create!(survey_id: survey_party.id, topic: "Local issues", question: "What is the most important issue for the people of your district? And how are you planning to address it?", order: 3)

# Participant.all.each do |participant|
#   answer = Faker::Lorem.paragraph(sentence_count: 10, supplemental: true, random_sentences_to_add: 5)
#   source = Faker::Lorem.paragraph(sentence_count: 1)

#   if participant.is_candidate
#     survey_answer_1 = SurveyAnswer.create!(survey_question_id: candidate_question_1.id, participant_id: participant.id, answer: answer, source: source)
#     survey_answer_2 = SurveyAnswer.create!(survey_question_id: candidate_question_2.id, participant_id: participant.id, answer: answer, source: source)
#     survey_answer_3 = SurveyAnswer.create!(survey_question_id: candidate_question_3.id, participant_id: participant.id, answer: answer, source: source)
#   else 
#     survey_answer_1 = SurveyAnswer.create!(survey_question_id: party_question_1.id, participant_id: participant.id, answer: answer, source: source)
#     survey_answer_2 = SurveyAnswer.create!(survey_question_id: party_question_2.id, participant_id: participant.id, answer: answer, source: source)
#     survey_answer_3 = SurveyAnswer.create!(survey_question_id: party_question_3.id, participant_id: participant.id, answer: answer, source: source)
#   end
# end