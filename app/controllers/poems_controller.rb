class PoemsController < ApplicationController
     layout "sidebar"
  def new
  @poem = Poem.new

end
def index
   @poems = Poem.order('created_at DESC')
end
def create
  @poem = Poem.new(user_params)

  if @poem.save
    flash[:success] = 'Poem added!'
    redirect_to poems_path
  else
    render 'new'
  end
end
protected
def user_params
     params.require(:poem).permit(:link,:title, :author, :duration, :uid)
   end


end
