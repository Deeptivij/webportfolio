class VideosController < ApplicationController
   layout "sidebar"
  def new
  @video = Video.new

    @video.build_description
end
def index
   @videos = Video.order('created_at DESC').paginate(:page => params[:page], :per_page => 4)
   @poems = Poem.order('created_at DESC').paginate(:page => params[:page], :per_page => 4)
end
def create
  @video = Video.new(user_params)

  if @video.save
    flash[:success] = 'Video added!'
    redirect_to root_url
  else
    render 'new'
  end
end
protected
def user_params
     params.require(:video).permit(:link, :title, :author, :duration,description_attributes: [:singer, :composer, :location])
   end

end
