# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ContentLocation.create!(name: "page_about_main")
ContentLocation.create!(name: "page_contact_main")
ContentLocation.create!(name: "page_home_main")
ContentLocation.create!(name: "page_volunteer_main")

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

LogType.create!(name: "User Log-In")

Party.create!(name: "Independent")
Party.create!(name: "Liberal Party of Canada", name_abbreviation: "Liberal", alternate_name: "Parti libéral du Canada", alternate_abbreviation: "Libéral")
Party.create!(name: "People's Party of Canada", name_abbreviation: "PPC", alternate_name: "Parti populaire du Canada", alternate_abbreviation: "PPC")
Party.create!(name: "Conservative Party of Canada", name_abbreviation: "Conservative", alternate_name: "Parti conservateur du Canada", alternate_abbreviation: "Conservateur")
Party.create!(name: "New Democratic Party", name_abbreviation: "NDP", alternate_name: "Nouveau Parti démocratique", alternate_abbreviation: "NPD")
Party.create!(name: "Bloc Québécois", name_abbreviation: "BQ")
Party.create!(name: "Green Party of Canada", name_abbreviation: "Green", alternate_name: "Parti vert du Canada", alternate_abbreviation: "Vert")

Province.create!(name: "Alberta")
Province.create!(name: "British Columbia")
Province.create!(name: "Manitoba")
Province.create!(name: "New Brunswick")
Province.create!(name: "Newfoundland and Labrador")
Province.create!(name: "Northwest Territories")
Province.create!(name: "Nova Scotia")
Province.create!(name: "Nunavut")
Province.create!(name: "Ontario")
Province.create!(name: "Prince Edward Island")
Province.create!(name: "Quebec")
Province.create!(name: "Saskatchewan")
Province.create!(name: "Yukon")

SocialMediaType.create!(name: "Facebook", website: "https://www.facebook.com/", icon: "fab fa-facebook-square fa-2x")
SocialMediaType.create!(name: "Instagram", website: "https://www.instagram.com/", icon: "fab fa-instagram-square fa-2x")
SocialMediaType.create!(name: "LinkedIn", website: "https://www.linkedin.com/in/", icon: "fab fa-linkedin fa-2x")
SocialMediaType.create!(name: "Medium", website: "https://medium.com/", icon: "fab fa-medium fa-2x")
SocialMediaType.create!(name: "Twitter", website: "https://twitter.com/", icon: "fab fa-twitter-square fa-2x")
SocialMediaType.create!(name: "Youtube", website: "https://www.youtube.com/", icon: "fab fa-youtube-square fa-2x")

SurveyType.create!(name: "Candidate")
SurveyType.create!(name: "Party")

SystemSetting.create!(name: "blank_avatar_name", setting: "blank_avatar.png")

UserType.create!(name: "Admin")
UserType.create!(name: "Volunteer")
UserType.create!(name: "Candidate")
UserType.create!(name: "Party Representative")

User.create!(first_name:  "Michael",
             last_name: "Dorsey",
             email: "michael.william.dorsey@gmail.com",
             user_type_id: UserType.find_by(name: 'Admin').id,
             password: "password",
             password_confirmation: "password",
             activated: true,
             activated_at: Time.zone.now)


# -----------------------------------------------------
# TEMPORARY FAKE DATA FOR TESTING PURPOSES
# -----------------------------------------------------

# Federal election districts
District.create!(name: "Abbotsford", jurisdiction_id: Jurisdiction.find_by(name: "British Columbia").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Abitibi—Baie-James--Nunavik--Eeyou", jurisdiction_id: Jurisdiction.find_by(name: "Quebec").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Abitibi—Témiscamingue", jurisdiction_id: Jurisdiction.find_by(name: "Quebec").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Acadie—Bathurst", jurisdiction_id: Jurisdiction.find_by(name: "New Brunswick").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Ahuntsic-Cartierville", jurisdiction_id: Jurisdiction.find_by(name: "Quebec").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Ajax", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Alfred-Pellan", jurisdiction_id: Jurisdiction.find_by(name: "Quebec").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Algoma—Manitoulin--Kapuskasing", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Argenteuil--La Petite-Nation", jurisdiction_id: Jurisdiction.find_by(name: "Quebec").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Aurora--Oak Ridges--Richmond Hill", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Avalon", jurisdiction_id: Jurisdiction.find_by(name: "Newfoundland and Labrador").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Avignon--La Mitis—Matane--Matapédia", jurisdiction_id: Jurisdiction.find_by(name: "Quebec").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Banff—Airdrie", jurisdiction_id: Jurisdiction.find_by(name: "Alberta").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Barrie—Innisfil", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Barrie—Springwater--Oro-Medonte", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Battle River—Crowfoot", jurisdiction_id: Jurisdiction.find_by(name: "Alberta").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Battlefords—Lloydminster", jurisdiction_id: Jurisdiction.find_by(name: "Saskatchewan").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Bay of Quinte", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Beaches--East York", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Beauce", jurisdiction_id: Jurisdiction.find_by(name: "Quebec").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Beauport-Côte-de-Beaupré-Île d'Orléans-Charlevoix", jurisdiction_id: Jurisdiction.find_by(name: "Quebec").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Beauport—Limoilou", jurisdiction_id: Jurisdiction.find_by(name: "Quebec").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Beauséjour", jurisdiction_id: Jurisdiction.find_by(name: "New Brunswick").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Bellechasse--Les Etchemins—Lévis", jurisdiction_id: Jurisdiction.find_by(name: "Quebec").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Beloeil—Chambly", jurisdiction_id: Jurisdiction.find_by(name: "Quebec").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Berthier—Maskinongé", jurisdiction_id: Jurisdiction.find_by(name: "Quebec").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Bonavista—Burin--Trinity", jurisdiction_id: Jurisdiction.find_by(name: "Newfoundland and Labrador").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Bourassa", jurisdiction_id: Jurisdiction.find_by(name: "Quebec").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Bow River", jurisdiction_id: Jurisdiction.find_by(name: "Alberta").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Brampton Centre", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Brampton East", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Brampton North", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Brampton South", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Brampton West", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Brandon—Souris", jurisdiction_id: Jurisdiction.find_by(name: "Manitoba").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Brantford—Brant", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Brome—Missisquoi", jurisdiction_id: Jurisdiction.find_by(name: "Quebec").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Brossard—Saint-Lambert", jurisdiction_id: Jurisdiction.find_by(name: "Quebec").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Bruce--Grey--Owen Sound", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Burlington", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Burnaby North—Seymour", jurisdiction_id: Jurisdiction.find_by(name: "British Columbia").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Burnaby South", jurisdiction_id: Jurisdiction.find_by(name: "British Columbia").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Bécancour—Nicolet--Saurel", jurisdiction_id: Jurisdiction.find_by(name: "Quebec").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Calgary Centre", jurisdiction_id: Jurisdiction.find_by(name: "Alberta").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Calgary Confederation", jurisdiction_id: Jurisdiction.find_by(name: "Alberta").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Calgary Forest Lawn", jurisdiction_id: Jurisdiction.find_by(name: "Alberta").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Calgary Heritage", jurisdiction_id: Jurisdiction.find_by(name: "Alberta").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Calgary Midnapore", jurisdiction_id: Jurisdiction.find_by(name: "Alberta").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Calgary Nose Hill", jurisdiction_id: Jurisdiction.find_by(name: "Alberta").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Calgary Rocky Ridge", jurisdiction_id: Jurisdiction.find_by(name: "Alberta").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Calgary Shepard", jurisdiction_id: Jurisdiction.find_by(name: "Alberta").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Calgary Signal Hill", jurisdiction_id: Jurisdiction.find_by(name: "Alberta").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Calgary Skyview", jurisdiction_id: Jurisdiction.find_by(name: "Alberta").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Cambridge", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Cape Breton—Canso", jurisdiction_id: Jurisdiction.find_by(name: "Nova Scotia").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Cardigan", jurisdiction_id: Jurisdiction.find_by(name: "Prince Edward Island").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Cariboo--Prince George", jurisdiction_id: Jurisdiction.find_by(name: "British Columbia").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Carleton", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Carlton Trail--Eagle Creek", jurisdiction_id: Jurisdiction.find_by(name: "Saskatchewan").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Central Nova", jurisdiction_id: Jurisdiction.find_by(name: "Nova Scotia").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Central Okanagan—Similkameen--Nicola", jurisdiction_id: Jurisdiction.find_by(name: "British Columbia").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Charlesbourg—Haute-Saint-Charles", jurisdiction_id: Jurisdiction.find_by(name: "Quebec").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Charleswood--St. James—Assiniboia--Headingley", jurisdiction_id: Jurisdiction.find_by(name: "Manitoba").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Charlottetown", jurisdiction_id: Jurisdiction.find_by(name: "Prince Edward Island").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Chatham-Kent—Leamington", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Chicoutimi--Le Fjord", jurisdiction_id: Jurisdiction.find_by(name: "Quebec").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Chilliwack—Hope", jurisdiction_id: Jurisdiction.find_by(name: "British Columbia").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Churchill--Keewatinook Aski", jurisdiction_id: Jurisdiction.find_by(name: "Manitoba").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Châteauguay—Lacolle", jurisdiction_id: Jurisdiction.find_by(name: "Quebec").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Cloverdale--Langley City", jurisdiction_id: Jurisdiction.find_by(name: "British Columbia").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Coast of Bays--Central--Notre Dame", jurisdiction_id: Jurisdiction.find_by(name: "Newfoundland and Labrador").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Compton—Stanstead", jurisdiction_id: Jurisdiction.find_by(name: "Quebec").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Coquitlam--Port Coquitlam", jurisdiction_id: Jurisdiction.find_by(name: "British Columbia").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Courtenay—Alberni", jurisdiction_id: Jurisdiction.find_by(name: "British Columbia").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Cowichan—Malahat--Langford", jurisdiction_id: Jurisdiction.find_by(name: "British Columbia").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Cumberland—Colchester", jurisdiction_id: Jurisdiction.find_by(name: "Nova Scotia").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Cypress Hills—Grasslands", jurisdiction_id: Jurisdiction.find_by(name: "Saskatchewan").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Dartmouth--Cole Harbour", jurisdiction_id: Jurisdiction.find_by(name: "Nova Scotia").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Dauphin--Swan River--Neepawa", jurisdiction_id: Jurisdiction.find_by(name: "Manitoba").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Davenport", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Delta", jurisdiction_id: Jurisdiction.find_by(name: "British Columbia").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Desnethé--Missinippi--Churchill River", jurisdiction_id: Jurisdiction.find_by(name: "Saskatchewan").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Don Valley East", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Don Valley North", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Don Valley West", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Dorval--Lachine--LaSalle", jurisdiction_id: Jurisdiction.find_by(name: "Quebec").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Drummond", jurisdiction_id: Jurisdiction.find_by(name: "Quebec").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Dufferin--Caledon", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Durham", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Edmonton Centre", jurisdiction_id: Jurisdiction.find_by(name: "Alberta").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Edmonton Griesbach", jurisdiction_id: Jurisdiction.find_by(name: "Alberta").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Edmonton Manning", jurisdiction_id: Jurisdiction.find_by(name: "Alberta").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Edmonton Mill Woods", jurisdiction_id: Jurisdiction.find_by(name: "Alberta").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Edmonton Riverbend", jurisdiction_id: Jurisdiction.find_by(name: "Alberta").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Edmonton Strathcona", jurisdiction_id: Jurisdiction.find_by(name: "Alberta").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Edmonton West", jurisdiction_id: Jurisdiction.find_by(name: "Alberta").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Edmonton--Wetaskiwin", jurisdiction_id: Jurisdiction.find_by(name: "Alberta").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Eglinton--Lawrence", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Egmont", jurisdiction_id: Jurisdiction.find_by(name: "Prince Edward Island").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Elgin--Middlesex--London", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Elmwood--Transcona", jurisdiction_id: Jurisdiction.find_by(name: "Manitoba").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Esquimalt--Saanich--Sooke", jurisdiction_id: Jurisdiction.find_by(name: "British Columbia").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Essex", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Etobicoke Centre", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Etobicoke--Lakeshore", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Etobicoke North", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Flamborough--Glanbrook", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Fleetwood--Port Kells", jurisdiction_id: Jurisdiction.find_by(name: "British Columbia").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Foothills", jurisdiction_id: Jurisdiction.find_by(name: "Alberta").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Fort McMurray--Cold Lake", jurisdiction_id: Jurisdiction.find_by(name: "Alberta").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Fredericton", jurisdiction_id: Jurisdiction.find_by(name: "New Brunswick").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Fundy Royal", jurisdiction_id: Jurisdiction.find_by(name: "New Brunswick").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Gaspésie--Les Îles-de-la-Madeleine", jurisdiction_id: Jurisdiction.find_by(name: "Quebec").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Gatineau", jurisdiction_id: Jurisdiction.find_by(name: "Quebec").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Glengarry--Prescott--Russell", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Grande Prairie--Mackenzie", jurisdiction_id: Jurisdiction.find_by(name: "Alberta").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Guelph", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Haldimand--Norfolk", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Haliburton--Kawartha Lakes--Brock", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Halifax", jurisdiction_id: Jurisdiction.find_by(name: "Nova Scotia").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Halifax West", jurisdiction_id: Jurisdiction.find_by(name: "Nova Scotia").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Hamilton Centre", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Hamilton East--Stoney Creek", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Hamilton Mountain", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Hamilton West--Ancaster--Dundas", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Hastings--Lennox and Addington", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Hochelaga", jurisdiction_id: Jurisdiction.find_by(name: "Quebec").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Honoré-Mercier", jurisdiction_id: Jurisdiction.find_by(name: "Quebec").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Hull--Aylmer", jurisdiction_id: Jurisdiction.find_by(name: "Quebec").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Humber River--Black Creek", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Huron--Bruce", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Joliette", jurisdiction_id: Jurisdiction.find_by(name: "Quebec").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Jonquière", jurisdiction_id: Jurisdiction.find_by(name: "Quebec").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Kamloops--Thompson--Cariboo", jurisdiction_id: Jurisdiction.find_by(name: "British Columbia").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Kanata--Carleton", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Kelowna--Lake Country", jurisdiction_id: Jurisdiction.find_by(name: "British Columbia").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Kenora", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Kildonan--St. Paul", jurisdiction_id: Jurisdiction.find_by(name: "Manitoba").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "King--Vaughan", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Kings--Hants", jurisdiction_id: Jurisdiction.find_by(name: "Nova Scotia").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Kingston and the Islands", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Kitchener Centre", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Kitchener--Conestoga", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Kitchener South--Hespeler", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Kootenay--Columbia", jurisdiction_id: Jurisdiction.find_by(name: "British Columbia").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "La Pointe-de-l'Île", jurisdiction_id: Jurisdiction.find_by(name: "Quebec").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "La Prairie", jurisdiction_id: Jurisdiction.find_by(name: "Quebec").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Labrador", jurisdiction_id: Jurisdiction.find_by(name: "Newfoundland and Labrador").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Lac-Saint-Jean", jurisdiction_id: Jurisdiction.find_by(name: "Quebec").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Lac-Saint-Louis", jurisdiction_id: Jurisdiction.find_by(name: "Quebec").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Lakeland", jurisdiction_id: Jurisdiction.find_by(name: "Alberta").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Lambton--Kent--Middlesex", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Lanark--Frontenac--Kingston", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Langley--Aldergrove", jurisdiction_id: Jurisdiction.find_by(name: "British Columbia").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "LaSalle--Émard--Verdun", jurisdiction_id: Jurisdiction.find_by(name: "Quebec").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Laurentides--Labelle", jurisdiction_id: Jurisdiction.find_by(name: "Quebec").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Laurier--Sainte-Marie", jurisdiction_id: Jurisdiction.find_by(name: "Quebec").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Laval--Les Îles", jurisdiction_id: Jurisdiction.find_by(name: "Quebec").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Leeds-Grenville-Thousand Islands and Rideau Lakes", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Lethbridge", jurisdiction_id: Jurisdiction.find_by(name: "Alberta").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "London--Fanshawe", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "London North Centre", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "London West", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Long Range Mountains", jurisdiction_id: Jurisdiction.find_by(name: "Newfoundland and Labrador").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Longueuil--Charles-LeMoyne", jurisdiction_id: Jurisdiction.find_by(name: "Quebec").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Longueuil--Saint-Hubert", jurisdiction_id: Jurisdiction.find_by(name: "Quebec").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Louis-Hébert", jurisdiction_id: Jurisdiction.find_by(name: "Quebec").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Louis-Saint-Laurent", jurisdiction_id: Jurisdiction.find_by(name: "Quebec").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Lévis--Lotbinière", jurisdiction_id: Jurisdiction.find_by(name: "Quebec").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Madawaska--Restigouche", jurisdiction_id: Jurisdiction.find_by(name: "New Brunswick").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Malpeque", jurisdiction_id: Jurisdiction.find_by(name: "Prince Edward Island").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Manicouagan", jurisdiction_id: Jurisdiction.find_by(name: "Quebec").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Marc-Aurèle-Fortin", jurisdiction_id: Jurisdiction.find_by(name: "Quebec").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Markham--Stouffville", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Markham--Thornhill", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Markham--Unionville", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Medicine Hat--Cardston--Warner", jurisdiction_id: Jurisdiction.find_by(name: "Alberta").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Milton", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Mirabel", jurisdiction_id: Jurisdiction.find_by(name: "Quebec").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Miramichi--Grand Lake", jurisdiction_id: Jurisdiction.find_by(name: "New Brunswick").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Mission--Matsqui--Fraser Canyon", jurisdiction_id: Jurisdiction.find_by(name: "British Columbia").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Mississauga Centre", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Mississauga East--Cooksville", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Mississauga--Erin Mills", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Mississauga--Lakeshore", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Mississauga--Malton", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Mississauga--Streetsville", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Moncton--Riverview--Dieppe", jurisdiction_id: Jurisdiction.find_by(name: "New Brunswick").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Montarville", jurisdiction_id: Jurisdiction.find_by(name: "Quebec").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Montcalm", jurisdiction_id: Jurisdiction.find_by(name: "Quebec").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Montmagny--L'Islet--Kamouraska--Rivière-du-Loup", jurisdiction_id: Jurisdiction.find_by(name: "Quebec").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Moose Jaw--Lake Centre--Lanigan", jurisdiction_id: Jurisdiction.find_by(name: "Saskatchewan").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Mount Royal", jurisdiction_id: Jurisdiction.find_by(name: "Quebec").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Mégantic--L'Érable", jurisdiction_id: Jurisdiction.find_by(name: "Quebec").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Nanaimo--Ladysmith", jurisdiction_id: Jurisdiction.find_by(name: "British Columbia").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Nepean", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "New Brunswick Southwest", jurisdiction_id: Jurisdiction.find_by(name: "New Brunswick").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "New Westminster--Burnaby", jurisdiction_id: Jurisdiction.find_by(name: "British Columbia").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Newmarket--Aurora", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Niagara Centre", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Niagara Falls", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Niagara West", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Nickel Belt", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Nipissing--Timiskaming", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "North Island--Powell River", jurisdiction_id: Jurisdiction.find_by(name: "British Columbia").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "North Okanagan--Shuswap", jurisdiction_id: Jurisdiction.find_by(name: "British Columbia").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "North Vancouver", jurisdiction_id: Jurisdiction.find_by(name: "British Columbia").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Northumberland--Peterborough South", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Northwest Territories", jurisdiction_id: Jurisdiction.find_by(name: "Northwest Territories").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Notre-Dame-de-Grâce--Westmount", jurisdiction_id: Jurisdiction.find_by(name: "Quebec").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Nunavut", jurisdiction_id: Jurisdiction.find_by(name: "Nunavut").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Oakville", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Oakville North--Burlington", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Orléans", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Oshawa", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Ottawa Centre", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Ottawa South", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Ottawa--Vanier", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Ottawa West--Nepean", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Outremont", jurisdiction_id: Jurisdiction.find_by(name: "Quebec").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Oxford", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Papineau", jurisdiction_id: Jurisdiction.find_by(name: "Quebec").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Parkdale--High Park", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Parry Sound--Muskoka", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Peace River--Westlock", jurisdiction_id: Jurisdiction.find_by(name: "Alberta").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Perth--Wellington", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Peterborough--Kawartha", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Pickering--Uxbridge", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Pierre-Boucher--Les Patriotes--Verchères", jurisdiction_id: Jurisdiction.find_by(name: "Quebec").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Pierrefonds--Dollard", jurisdiction_id: Jurisdiction.find_by(name: "Quebec").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Pitt Meadows--Maple Ridge", jurisdiction_id: Jurisdiction.find_by(name: "British Columbia").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Pontiac", jurisdiction_id: Jurisdiction.find_by(name: "Quebec").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Port Moody--Coquitlam", jurisdiction_id: Jurisdiction.find_by(name: "British Columbia").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Portage--Lisgar", jurisdiction_id: Jurisdiction.find_by(name: "Manitoba").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Portneuf--Jacques-Cartier", jurisdiction_id: Jurisdiction.find_by(name: "Quebec").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Prince Albert", jurisdiction_id: Jurisdiction.find_by(name: "Saskatchewan").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Prince George--Peace River--Northern Rockies", jurisdiction_id: Jurisdiction.find_by(name: "British Columbia").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Provencher", jurisdiction_id: Jurisdiction.find_by(name: "Manitoba").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Québec", jurisdiction_id: Jurisdiction.find_by(name: "Quebec").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Red Deer--Lacombe", jurisdiction_id: Jurisdiction.find_by(name: "Alberta").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Red Deer--Mountain View", jurisdiction_id: Jurisdiction.find_by(name: "Alberta").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Regina--Lewvan", jurisdiction_id: Jurisdiction.find_by(name: "Saskatchewan").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Regina--Qu'Appelle", jurisdiction_id: Jurisdiction.find_by(name: "Saskatchewan").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Regina--Wascana", jurisdiction_id: Jurisdiction.find_by(name: "Saskatchewan").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Renfrew--Nipissing--Pembroke", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Repentigny", jurisdiction_id: Jurisdiction.find_by(name: "Quebec").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Richmond--Arthabaska", jurisdiction_id: Jurisdiction.find_by(name: "Quebec").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Richmond Centre", jurisdiction_id: Jurisdiction.find_by(name: "British Columbia").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Richmond Hill", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Rimouski-Neigette--Témiscouata--Les Basques", jurisdiction_id: Jurisdiction.find_by(name: "Quebec").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Rivière-des-Mille-Îles", jurisdiction_id: Jurisdiction.find_by(name: "Quebec").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Rivière-du-Nord", jurisdiction_id: Jurisdiction.find_by(name: "Quebec").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Rosemont--La Petite-Patrie", jurisdiction_id: Jurisdiction.find_by(name: "Quebec").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Saanich--Gulf Islands", jurisdiction_id: Jurisdiction.find_by(name: "British Columbia").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Sackville--Preston--Chezzetcook", jurisdiction_id: Jurisdiction.find_by(name: "Nova Scotia").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Saint Boniface--Saint Vital", jurisdiction_id: Jurisdiction.find_by(name: "Manitoba").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Saint-Hyacinthe--Bagot", jurisdiction_id: Jurisdiction.find_by(name: "Quebec").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Saint-Jean", jurisdiction_id: Jurisdiction.find_by(name: "Quebec").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Saint John--Rothesay", jurisdiction_id: Jurisdiction.find_by(name: "New Brunswick").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Saint-Laurent", jurisdiction_id: Jurisdiction.find_by(name: "Quebec").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Saint-Léonard--Saint-Michel", jurisdiction_id: Jurisdiction.find_by(name: "Quebec").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Saint-Maurice--Champlain", jurisdiction_id: Jurisdiction.find_by(name: "Quebec").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Salaberry--Suroît", jurisdiction_id: Jurisdiction.find_by(name: "Quebec").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Sarnia--Lambton", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Saskatoon--Grasswood", jurisdiction_id: Jurisdiction.find_by(name: "Saskatchewan").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Saskatoon--University", jurisdiction_id: Jurisdiction.find_by(name: "Saskatchewan").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Saskatoon West", jurisdiction_id: Jurisdiction.find_by(name: "Saskatchewan").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Sault Ste. Marie", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Scarborough--Agincourt", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Scarborough Centre", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Scarborough--Guildwood", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Scarborough North", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Scarborough--Rouge Park", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Scarborough Southwest", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Selkirk--Interlake--Eastman", jurisdiction_id: Jurisdiction.find_by(name: "Manitoba").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Shefford", jurisdiction_id: Jurisdiction.find_by(name: "Quebec").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Sherbrooke", jurisdiction_id: Jurisdiction.find_by(name: "Quebec").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Sherwood Park--Fort Saskatchewan", jurisdiction_id: Jurisdiction.find_by(name: "Alberta").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Simcoe--Grey", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Simcoe North", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Skeena--Bulkley Valley", jurisdiction_id: Jurisdiction.find_by(name: "British Columbia").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Souris--Moose Mountain", jurisdiction_id: Jurisdiction.find_by(name: "Saskatchewan").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "South Okanagan--West Kootenay", jurisdiction_id: Jurisdiction.find_by(name: "British Columbia").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "South Shore--St. Margarets", jurisdiction_id: Jurisdiction.find_by(name: "Nova Scotia").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "South Surrey--White Rock", jurisdiction_id: Jurisdiction.find_by(name: "British Columbia").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Spadina--Fort York", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "St. Albert--Edmonton", jurisdiction_id: Jurisdiction.find_by(name: "Alberta").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "St. Catharines", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "St. John's East", jurisdiction_id: Jurisdiction.find_by(name: "Newfoundland and Labrador").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "St. John's South--Mount Pearl", jurisdiction_id: Jurisdiction.find_by(name: "Newfoundland and Labrador").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Steveston--Richmond East", jurisdiction_id: Jurisdiction.find_by(name: "British Columbia").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Stormont--Dundas--South Glengarry", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Sturgeon River--Parkland", jurisdiction_id: Jurisdiction.find_by(name: "Alberta").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Sudbury", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Surrey Centre", jurisdiction_id: Jurisdiction.find_by(name: "British Columbia").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Surrey--Newton", jurisdiction_id: Jurisdiction.find_by(name: "British Columbia").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Sydney--Victoria", jurisdiction_id: Jurisdiction.find_by(name: "Nova Scotia").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Terrebonne", jurisdiction_id: Jurisdiction.find_by(name: "Quebec").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Thornhill", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Thunder Bay--Rainy River", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Thunder Bay--Superior North", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Thérèse-De Blainville", jurisdiction_id: Jurisdiction.find_by(name: "Quebec").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Timmins--James Bay", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Tobique--Mactaquac", jurisdiction_id: Jurisdiction.find_by(name: "New Brunswick").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Toronto Centre", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Toronto--Danforth", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Toronto--St. Paul's", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Trois-Rivières", jurisdiction_id: Jurisdiction.find_by(name: "Quebec").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "University--Rosedale", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Vancouver Centre", jurisdiction_id: Jurisdiction.find_by(name: "British Columbia").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Vancouver East", jurisdiction_id: Jurisdiction.find_by(name: "British Columbia").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Vancouver Granville", jurisdiction_id: Jurisdiction.find_by(name: "British Columbia").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Vancouver Kingsway", jurisdiction_id: Jurisdiction.find_by(name: "British Columbia").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Vancouver Quadra", jurisdiction_id: Jurisdiction.find_by(name: "British Columbia").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Vancouver South", jurisdiction_id: Jurisdiction.find_by(name: "British Columbia").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Vaudreuil--Soulanges", jurisdiction_id: Jurisdiction.find_by(name: "Quebec").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Vaughan--Woodbridge", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Victoria", jurisdiction_id: Jurisdiction.find_by(name: "British Columbia").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Ville-Marie--Le Sud-Ouest--Île-des-Soeurs", jurisdiction_id: Jurisdiction.find_by(name: "Quebec").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Vimy", jurisdiction_id: Jurisdiction.find_by(name: "Quebec").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Waterloo", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Wellington--Halton Hills", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "West Nova", jurisdiction_id: Jurisdiction.find_by(name: "Nova Scotia").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "West Vancouver--Sunshine Coast--Sea to Sky Country", jurisdiction_id: Jurisdiction.find_by(name: "British Columbia").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Whitby", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Willowdale", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Windsor--Tecumseh", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Windsor West", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Winnipeg Centre", jurisdiction_id: Jurisdiction.find_by(name: "Manitoba").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Winnipeg North", jurisdiction_id: Jurisdiction.find_by(name: "Manitoba").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Winnipeg South", jurisdiction_id: Jurisdiction.find_by(name: "Manitoba").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Winnipeg South Centre", jurisdiction_id: Jurisdiction.find_by(name: "Manitoba").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Yellowhead", jurisdiction_id: Jurisdiction.find_by(name: "Alberta").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "York Centre", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "York--Simcoe", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "York South--Weston", jurisdiction_id: Jurisdiction.find_by(name: "Ontario").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Yorkton--Melville", jurisdiction_id: Jurisdiction.find_by(name: "Saskatchewan").id, election_type_id: ElectionType.find_by(name: "Federal").id)
District.create!(name: "Yukon", jurisdiction_id: Jurisdiction.find_by(name: "Yukon ").id, election_type_id: ElectionType.find_by(name: "Federal").id)

current_election = Election.create!(name: "Canadian Federal Election",
                                    election_date: DateTime.new(2021, 10, 21),
                                    election_type_id: ElectionType.find_by(name: "Federal").id,
                                    jurisdiction_id: Jurisdiction.find_by(name: "Canada").id,
                                    active: true)

current_election.districts = District.all

avatar_id = 1

District.all.each do |district|

  Party.all.each do |party|

    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    email = Faker::Internet.email
    biography = Faker::Lorem.paragraph(sentence_count: 20, supplemental: true, random_sentences_to_add: 10)
    phone = Faker::PhoneNumber.phone_number
    address = Address.create!(street: Faker::Address.street_address, city: Faker::Address.city, province_id: Province.find_by(name: "Alberta").id, postal_code: Faker::Address.postcode)
    website = Faker::Internet.url

    current_user = User.create!(first_name: first_name,
                                last_name: last_name,             
                                email: email,
                                user_type_id: UserType.find_by(name: 'Candidate').id,
                                password: "password",
                                password_confirmation: "password",
                                activated: true,
                                activated_at: Time.zone.now)
    
    candidate = Participant.create!(user_id: current_user.id,
                        is_candidate: true,
                        is_incumbent: false,
                        district_id: district.id,
                        party_id: party.id,
                        name: current_user.first_name + " " + current_user.last_name,
                        email: current_user.email,
                        website: website,
                        phone: phone,
                        address: address,
                        biography: biography)

    candidate.picture.attach(io: File.open('/home/michael/vote_app/vote_app/app/assets/images/seed_avatar' + avatar_id.to_s + '.png'), filename: 'seed_avatar' + avatar_id.to_s + '.png')
    avatar_id += 1
    if avatar_id === 6
      avatar_id = 1
    end
  end
end

# Create the party participants and set the party leader
Party.where.not(name: "Independent").each do |party|

  party_member = Participant.where(party_id: party.id).first
  phone = Faker::PhoneNumber.phone_number
  address = Address.create!(street: Faker::Address.street_address, city: Faker::Address.city, province_id: Province.find_by(name: "Alberta").id, postal_code: Faker::Address.postcode)
  website = Faker::Internet.url
  email = Faker::Internet.email
  biography = Faker::Lorem.paragraph(sentence_count: 20, supplemental: true, random_sentences_to_add: 10)

  party_participant = Participant.create!(user_id: party_member.id,
                                          is_candidate: false,
                                          is_incumbent: false,
                                          party_id: party.id,
                                          name: party.name,
                                          email: email,
                                          website: website,
                                          phone: phone,
                                          address: address,
                                          biography: biography,
                                          leader_participant_id: party_member.id)

  party_participant.picture.attach(io: File.open('/home/michael/vote_app/vote_app/app/assets/images/seed_avatar' + avatar_id.to_s + '.png'), filename: 'seed_avatar' + avatar_id.to_s + '.png')
  avatar_id += 1
  if avatar_id === 6
    avatar_id = 1
  end
end

# Add all participants to the current election
current_election.participants = Participant.all

# Create the surveys
survey_candidate = Survey.create!(name: "Canadian Federal Election - Candidate", survey_type_id: SurveyType.find_by(name: 'Candidate').id, election_id: current_election.id)
survey_party = Survey.create!(name: "Canadian Federal Election - Party", survey_type_id: SurveyType.find_by(name: 'Party').id, election_id: current_election.id)

candidate_question_1 = SurveyQuestion.create!(survey_id: survey_candidate.id, topic: "Climate change", question: "What is your plan to combat climate change?", order: 1)
candidate_question_2 = SurveyQuestion.create!(survey_id: survey_candidate.id, topic: "COVID-19", question: "What is your plan for managing the coronavirus?", order: 2)
candidate_question_3 = SurveyQuestion.create!(survey_id: survey_candidate.id, topic: "Local issues", question: "What is the most important issue for the people of your district? And how are you planning to address it?", order: 3)

party_question_1 = SurveyQuestion.create!(survey_id: survey_party.id, topic: "Climate change", question: "What is your plan to combat climate change?", order: 1)
party_question_2 = SurveyQuestion.create!(survey_id: survey_party.id, topic: "COVID-19", question: "What is your plan for managing the coronavirus?", order: 2)
party_question_3 = SurveyQuestion.create!(survey_id: survey_party.id, topic: "Local issues", question: "What is the most important issue for the people of your district? And how are you planning to address it?", order: 3)

Participant.all.each do |participant|
  answer = Faker::Lorem.paragraph(sentence_count: 10, supplemental: true, random_sentences_to_add: 5)
  source = Faker::Lorem.paragraph(sentence_count: 1)

  if participant.is_candidate
    survey_answer_1 = SurveyAnswer.create!(survey_question_id: candidate_question_1.id, participant_id: participant.id, answer: answer, source: source)
    survey_answer_2 = SurveyAnswer.create!(survey_question_id: candidate_question_2.id, participant_id: participant.id, answer: answer, source: source)
    survey_answer_3 = SurveyAnswer.create!(survey_question_id: candidate_question_3.id, participant_id: participant.id, answer: answer, source: source)
  else 
    survey_answer_1 = SurveyAnswer.create!(survey_question_id: party_question_1.id, participant_id: participant.id, answer: answer, source: source)
    survey_answer_2 = SurveyAnswer.create!(survey_question_id: party_question_2.id, participant_id: participant.id, answer: answer, source: source)
    survey_answer_3 = SurveyAnswer.create!(survey_question_id: party_question_3.id, participant_id: participant.id, answer: answer, source: source)
  end
end