class Spree::Admin::VideosController < Spree::Admin::BaseController
  def index
    @videos = Spree::Video.all
  end

  def new

  end

  def create
    @video = Spree::Video.new(video_params)
    url = upload_to_vimeo(params[:video_file])
    @video.vimeo_url = url
    if @video.save
      # Call a method to upload the video to Vimeo
      redirect_to videos_path, notice: 'Video was successfully created.'
    else
      render :new
    end
  end

  private

  def video_params
    params.permit(:name, :description)
  end

  def upload_to_vimeo(video_file)
    client = VimeoMe2::User.new(ENV.fetch("VIMEO_ACCESS_TOKEN"))

    upload = client.upload_video(video_file)

    # # Set video metadata
    # upload.update(
    #   name: 'aaa',
    #   description: "aaa"
    # )
    #
    # # Wait for the upload to finish processing
    # upload.wait_for_completion

    # Get the video URI after the upload is complete
    video_uri = upload['uri']

    # Save the video URI to your video model or perform any additional actions

    # Delete the temporary file
    File.delete(video_file.path)
    video_uri
  end
end
