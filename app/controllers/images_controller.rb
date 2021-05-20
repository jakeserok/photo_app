class ImagesController < ApplicationController
  before_action :set_image, only: %i[ show destroy ]

  def index
    @images = Image.all
  end

  def show
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    @image.user = current_user

    respond_to do |f|
      if @image.save
        f.html { redirect_to @image, notice: "Image was uploaded successfully" }
        f.json { render :show, status: :created, location: @image }
      else
        f.html { render :new, status: :unprocessable_entity }
        f.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @image.destroy
    respond_to do |f|
      f.html { redirect_to images_url, notice: "Image was successfully destroyed." }
      f.json { head :no_content }
    end
  end

  private
  def set_image
    @image = Image.find(params[:id])
  end

  def image_params
    params.require(:image).permit(:title, :image)
  end
end
