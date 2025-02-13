class ChouLovePicturesController < ApplicationController
  before_action :set_chou_love_picture, only: %i[ show edit update destroy ]

  # GET /chou_love_pictures or /chou_love_pictures.json
  def index
    @chou_love_pictures = ChouLovePicture.all
  end

  # GET /chou_love_pictures/1 or /chou_love_pictures/1.json
  def show
  end

  # GET /chou_love_pictures/new
  def new
    @chou_love_picture = ChouLovePicture.new
  end

  # GET /chou_love_pictures/1/edit
  def edit
  end

  # POST /chou_love_pictures or /chou_love_pictures.json
  def create
    @chou_love_picture = ChouLovePicture.new(chou_love_picture_params)

    respond_to do |format|
      if @chou_love_picture.save
        format.html { redirect_to @chou_love_picture, notice: "Chou love picture was successfully created." }
        format.json { render :show, status: :created, location: @chou_love_picture }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @chou_love_picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chou_love_pictures/1 or /chou_love_pictures/1.json
  def update
    respond_to do |format|
      if @chou_love_picture.update(chou_love_picture_params)
        format.html { redirect_to @chou_love_picture, notice: "Chou love picture was successfully updated." }
        format.json { render :show, status: :ok, location: @chou_love_picture }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @chou_love_picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chou_love_pictures/1 or /chou_love_pictures/1.json
  def destroy
    @chou_love_picture.destroy!

    respond_to do |format|
      format.html { redirect_to chou_love_pictures_path, status: :see_other, notice: "Chou love picture was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chou_love_picture
      @chou_love_picture = ChouLovePicture.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def chou_love_picture_params
      params.require(:chou_love_picture).permit(:latitude, :longitude, :name, :file_path)
    end
end
