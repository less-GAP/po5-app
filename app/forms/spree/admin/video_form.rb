class Spree::Admin::VideoForm
  include ActiveModel::Model

  attr_accessor :name, :description, :video_file

  validates :name, presence: true
  validates :description, presence: true
  validates :video_file, presence: true

  def save
    return false unless valid?

    vimeo_service = Spree::Admin::UploadVideoService.new
    video_uri = vimeo_service.upload_video(video_file)

    return false if video_uri.blank?

    Spree::Video.create(video_url: "https://player.vimeo.com#{video_uri}", name: name, description: description)
  end
end
