# == Schema Information
#
# Table name: videos
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  link       :string(255)
#  uid        :string(255)
#  author     :string(255)
#  duration   :string(255)
#  likes      :integer
#  dislikes   :integer
#

class Video < ActiveRecord::Base

  has_one :description
    accepts_nested_attributes_for :description

YT_LINK_FORMAT = /\A.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*/i

  before_create -> do
    uid = link.match(YT_LINK_FORMAT)
    self.uid = uid[2] if uid && uid[2]

    if self.uid.to_s.length != 11
      self.errors.add(:link, 'is invalid.')
      false
    elsif Video.where(uid: self.uid).any?
      self.errors.add(:link, 'is not unique.')
      print('not eneterd ')
      false
    else
      get_additional_info
      print('enetred get')
    end
  end

  validates :link, presence: true, format: YT_LINK_FORMAT

  private

  def get_additional_info
    print('eneghdghjghg')

  video = Yt::Video.new id:  self.uid
   self.uid = video.id
   self.title = video.title
   self.duration = parse_duration(video.duration)
  # channel = Yt::Channel.new id:  'UCZLlwomh3wVg8TMl9sTZMog'
  #video1=channel.videos
#  video1.each do|d|
#    self.uid=d.id
#    self.title=d.title
#end
  # self.likes = video.like_count
  # self.dislikes = video.dislike_count
  # self.published_at = video.published_at
    #   byebug

      #client = YouTubeIt::OAuth2Client.new(dev_key:'AIzaSyDzpwH2BpDs13x9tSRMGpDY8Gnx7TGnHvI	 ')
      #video = client.video_by(uid)

      #self.title = video.title
      #self.duration = parse_duration(video.duration)
      #self.author = video.author.name
      #byebug
  end
  def get_poems
     channel = Yt::Channel.new id:  'UCZLlwomh3wVg8TMl9sTZMog'
    video1=channel.videos
   video1.each do|d|
      self.uid=d.id
      self.title=d.title
      self.duration = parse_duration(d.duration)
  end
  end
  def parse_duration(d)
    hr = (d / 3600).floor
    min = ((d - (hr * 3600)) / 60).floor
    sec = (d - (hr * 3600) - (min * 60)).floor

    hr = '0' + hr.to_s if hr.to_i < 10
    min = '0' + min.to_s if min.to_i < 10
    sec = '0' + sec.to_s if sec.to_i < 10

    hr.to_s + ':' + min.to_s + ':' + sec.to_s
  end
end
