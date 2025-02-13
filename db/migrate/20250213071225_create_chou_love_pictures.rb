class CreateChouLovePictures < ActiveRecord::Migration[7.1]
  def change
    create_table :chou_love_pictures do |t|
      t.string :latitude
      t.string :longitude
      t.string :name
      t.string :file_path

      t.timestamps
    end
  end
end
