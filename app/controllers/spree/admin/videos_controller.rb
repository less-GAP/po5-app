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

      private

      def video_params
        params.permit(:name, :description, :video_file)
      end
    end
  end
end

