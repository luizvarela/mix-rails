class SongsController < ApplicationController
  
  def index

    @songs = Song.published.all

    respond_to do |format|
      format.json { render json: @songs }
    end
  end

  def player
    render layout: false
  end

end