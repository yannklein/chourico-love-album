class PagesController < ApplicationController
  def home
    @pictures = ChouLovePicture.all

    @markers = @pictures.select {|p| p.latitude.present?}.map do |picture|
      {
        lat: picture.latitude,
        lng: picture.longitude,
        marker_html: render_to_string(partial: "marker", locals: { picture: picture })
      }
    end
  end
end
