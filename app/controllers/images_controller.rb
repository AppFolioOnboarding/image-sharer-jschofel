class ImagesController < ApplicationController
  def show
    @image = Image.find(params.require(:id))
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    if @image.save
      redirect_to @image
    else
      render :new
    end
  end

  private

  def image_params
    params.require(:image).permit(:url, :tag_list)
  end
end
