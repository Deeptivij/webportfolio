class LyricsController < ApplicationController
  layout "sidebar"
def new
@lyric = Lyric.new
end
def show
@lyric=Lyric.find(params[:id])

@file=File.open("#{Rails.root.join('reads', "#{@lyric.title}")}")
end
def index
	@lyrics1 = Lyric.where('read_type=?','couplet').order('created_at DESC').paginate(:page => params[:page], :per_page => 16)
	@lyrics = Lyric.where('read_type=?','poem').order('created_at DESC').paginate(:page => params[:page], :per_page => 16)
end
def read
	@lyrics = Lyric.where('read_type=?','poem')
end
def create
@lyric = Lyric.new(user_params)
if Dir.exists?("reads")
  f = File.open("#{Rails.root.join('reads', "#{user_params[:title]}")}", "w")
  f.write("#{user_params[:text]}")
  f.close #=
else
Dir.mkdir("reads")
f = File.open("#{Rails.root.join('reads', "#{user_params[:title]}")}", "w")
f.write("#{user_params[:text]}")
f.close #=
end
if @lyric.save
 flash[:success] = 'Lyric added!'
 redirect_to lyrics_path
else
 render 'new'
end
end
protected
def user_params
  params.require(:lyric).permit(:title, :description, :text,:read_type)
end

end
