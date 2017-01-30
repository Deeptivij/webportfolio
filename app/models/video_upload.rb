class VideoUpload < ActiveType::Object
  attribute :file
  attribute :title
  attribute :description

  attribute :file
  attribute :title
  def upload!()
account = Yt::Account.new refresh_token: '1/1069758067836-4jf1pp4usjs0jin8rkfaifgu47tor34o'
account.upload_video self.file, title: self.title, description: self.description
end
end
