class CreateSocialMediaProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :social_media_profiles do |t|
      t.string :handle
      t.references :participant, foreign_key: true
      t.references :social_media_type, foreign_key: true

      t.timestamps
    end
  end
end
