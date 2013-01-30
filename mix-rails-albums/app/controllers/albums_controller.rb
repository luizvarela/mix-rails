class AlbumsController < ApplicationController
  
  def index
    @albums = Album.published.paginate(:page => params[:page], :per_page => 12)
  end

  def show
    @album = Album.find(params[:id])
  end
  
end