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
ContentLocation.create!(name: "page_election_instructions")
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
