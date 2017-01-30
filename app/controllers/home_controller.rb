class HomeController < ApplicationController
  layout 'sidebar'
  def index
     @videos = Video.order('created_at DESC')
      @poems = Poem.order('created_at DESC')
       @lyrics = Lyric.order('created_at DESC')
  end
  def about_us
  end
  def contact_us
  end
  def messages
    name=params[:name]
    email=params[:email]
    contact=params[:phone_number]
    message=params[:message]
    cookies[:name]=name
    cookies[:email]=email
    cookies[:phone_number]=contact
    cookies[:message]=message
    send_contact_us_mail
  redirect_to contact_us_home_index_path(type:'email sent')
  end
  def send_contact_us_mail
    @name=cookies[:name]
    @email=cookies[:email]
    @number=cookies[:phone_number]
    @message=cookies[:message]
    res = Mailer.contact_info(@name,@email,@number,@message).deliver_now
  end
end
