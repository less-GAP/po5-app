require 'vimeo_me2'

class Spree::Admin::UploadVideoService
  def initialize
    @client = VimeoMe2::User.new(ENV.fetch("VIMEO_ACCESS_TOKEN"))
  end

  def upload_video(video_file)
    begin
      upload = client.upload_video(video_file)
      video_uri = upload['uri']
      File.delete(video_file.path)
      video_uri
    rescue VimeoMe2::RequestFailed => e
      Rails.logger.error "Vimeo upload failed: #{e.message}"
      nil
    end
  end
end
