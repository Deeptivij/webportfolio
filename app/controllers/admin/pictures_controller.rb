class Admin::PicturesController < ApplicationController
layout "sidebar"
before_filter :authenticate_admin!
def index
    @pictures = Picture.order('created_at')

  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(photo_params)
    if @picture.save
      flash[:success] = "The photo was added!"
      redirect_to admin_pictures_path
    else
      render 'new'
    end
  end

  private

  def photo_params
    params.require(:picture).permit(:image, :description)
  end
end
