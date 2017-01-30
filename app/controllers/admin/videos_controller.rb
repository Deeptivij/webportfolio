class Admin::VideosController < ApplicationController
   layout "sidebar"
   before_filter :authenticate_admin!
  def new
  @video = Video.new

    @video.build_description
end
def index
   @videos = Video.order('created_at DESC')
end
def create
  @video = Video.new(user_params)

  if @video.save
    flash[:success] = 'Video added!'
    redirect_to admin_videos_path
  else
    render 'new'
  end
end
protected
def user_params
     params.require(:video).permit(:link, :title, :author, :duration,description_attributes: [:singer, :composer, :location])
   end

end
