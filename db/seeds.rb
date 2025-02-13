# db/seeds.rb

require 'mini_exiftool'

puts "Reset Seeds..."
ChouLovePicture.destroy_all

puts "Seeding..."
image_dir = Rails.root.join('app/assets/images/photos')
image_files = Dir.glob(File.join(image_dir, '*.{jpg,jpeg,png,gif}'))

image_files.each do |file_path|
  exif = MiniExiftool.new(file_path)

  # Extract GPS data if available
  latitude = exif[:gpslatitude]&.to_s
  longitude = exif[:gpslongitude]&.to_s

  # Convert the file path to be usable with Rails' `image_tag` helper
  relative_path = file_path.sub(Rails.root.join('app/assets/images/').to_s, '')


  ChouLovePicture.create!(
    name: File.basename(file_path, '.*'),
    file_path: relative_path, # This is now usable with `image_tag`
    latitude: latitude,
    longitude: longitude
  )
end

puts "Seeded #{image_files.count} pictures!"