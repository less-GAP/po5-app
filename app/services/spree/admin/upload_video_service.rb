require 'vimeo_me2'

class Spree::Admin::UploadVideoService
  def initialize
    @client = VimeoMe2::User.new(ENV.fetch("VIMEO_ACCESS_TOKEN"))
  end

  def upload_video(video_file)
    begin
      upload = @client.upload_video(video_file)
      video_uri = upload['uri']
      File.delete(video_file.path)

      # Publish the video to everyone
      publish_video(video_uri)

      video_uri
    rescue VimeoMe2::RequestFailed => e
      Rails.logger.error "Vimeo upload failed: #{e.message}"
      nil
    end
  end

  private
  def publish_video(video_uri)
    vimeo_video = VimeoMe2::Video.new(ENV.fetch("VIMEO_ACCESS_TOKEN"), video_uri)
    vimeo_video.privacy = {view: 'anybody'}
    vimeo_video.update
  end

end
