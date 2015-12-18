class AddPhotoUrlToDestinations < ActiveRecord::Migration
  def change
    add_column :destinations, :photo_url, :string
  end
end
