# db/seeds.rb

require 'mini_exiftool'

# Converts "40 deg 36' 13.07\" N" to decimal format
def dms_to_decimal(dms, direction)
  return nil if dms.nil?

  match = dms.match(/(\d+) deg (\d+)' ([\d.]+)" (\w)/)
  return nil unless match

  degrees = match[1].to_f
  minutes = match[2].to_f
  seconds = match[3].to_f
  hemisphere = match[4]

  decimal = degrees + (minutes / 60) + (seconds / 3600)
  decimal *= -1 if ['S', 'W'].include?(hemisphere) # South and West are negative

  decimal
end

puts "Reset Seeds..."
ChouLovePicture.destroy_all

puts "Seeding..."
image_dir = Rails.root.join('app/assets/images/photos')
image_files = Dir.glob(File.join(image_dir, '*.{jpg,jpeg,png,gif}'))

image_files.each do |file_path|
  exif = MiniExiftool.new(file_path)

  # Extract GPS data if available
  latitude = dms_to_decimal(exif[:gpslatitude], exif[:gpslatituderef])
  longitude = dms_to_decimal(exif[:gpslongitude], exif[:gpslongituderef])

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