class Spree::Admin::VideosController < Spree::Admin::BaseController
  def index
    @videos = Spree::Video.all
  end

  def create
    @video = Spree::Video.new(video_params)
    if @video.save
      # Call a method to upload the video to Vimeo
      upload_to_vimeo(@video)
      redirect_to videos_path, notice: 'Video was successfully created.'
    else
      render :new
    end
  end

  private

  def video_params
    params.require(:video).permit(:name, :description)
  end

  def upload_to_vimeo(video)
    client = VimeoMe2::User.new(access_token: 'YOUR_VIMEO_ACCESS_TOKEN')
    response = client.upload(video.video_file.path, name: video.name)

    if response.success?
      video.vimeo_url = response.link
      video.save
    else
      # Handle the upload failure
    end
  end
end
