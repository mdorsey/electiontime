class CreateSocialMediaTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :social_media_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
