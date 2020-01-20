class ImagesController < ApplicationController
  def show
    @image = Image.find(params.require(:id))
  end

  def index
    @image_tag = params[:tag]
    @images = if !@image_tag.nil?
                Image.tagged_with(params[:tag]).order(created_at: :desc)
              else
                Image.order(created_at: :desc)
              end
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

  def destroy
    @image = Image.find(params[:id])
    @image.destroy!
    redirect_to root_path
  end

  private

  def image_params
    params.require(:image).permit(:url, :tag_list)
  end
end
