class VideosController < ApplicationController

  def index
    @videos = Video.most_recent.all
  end

  def show
    @video = Video.find(params[:id])
  end

end
