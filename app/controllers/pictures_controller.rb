class PicturesController < ApplicationController
layout "sidebar"
def index
    @pictures = Picture.order('created_at DESC').paginate(:page => params[:page], :per_page => 8)

  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(photo_params)
    if @picture.save
      flash[:success] = "The photo was added!"
      redirect_to pictures_path
    else
      render 'new'
    end
  end

  private

  def photo_params
    params.require(:picture).permit(:image, :description)
  end
end
