class PagesController < ApplicationController
  def home
    @pictures = ChouLovePicture.all

    @markers = @pictures.map do |picture|
      {
        lat: picture.latitude,
        lng: picture.longitude
      }
    end
  end
end
