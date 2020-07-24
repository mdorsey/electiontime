class AddImageToSocialMediaTypes < ActiveRecord::Migration[5.2]
  def change
    add_column :social_media_types, :icon, :string
  end
end
