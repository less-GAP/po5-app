module Spree
  module Admin
    class VideosController < ResourceController

      def index
        @videos = Spree::Video.all
      end

      def new
      end

      def create
        @video_form = Spree::Admin::VideoForm.new(video_params)
        if @video_form.save
          redirect_to spree.admin_videos_path, notice: 'Video successfully created.'
        else
          render :new
        end
      end

      def edit
        @video = Spree::Video.find_by(params[:id])
        redirect_to action: :index unless @video
      end

      def destroy
        @video = Spree::Video.find_by(params[:id])
        return unless @video

        @video.destroy
        redirect_to action: :index, notice: 'Video deleted successfully'
      end

      private
      def video_params
        params.require(:video).permit(:name, :description, :video_file)
      end
    end
  end
end

