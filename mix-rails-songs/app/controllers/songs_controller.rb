class SongsController < ApplicationController

  def index

    @songs = Song.published.all

    respond_to do |format|
      format.json { render json: @songs }
    end

  end

  def shuffled

    @songs = Song.published.all.shuffle

    respond_to do |format|
      format.json { render json: @songs }
    end
    
  end

  def player
    @shuffled = params[:shuffled] || false
    @songs_api = @shuffled ? shuffled_songs_path(:json) : songs_path(:json)
    render layout: false
  end

end