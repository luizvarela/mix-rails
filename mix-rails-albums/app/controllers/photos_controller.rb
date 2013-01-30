class PhotosController < ApplicationController
  
  def index
    #@albums = Album.published.paginate(:page => params[:page], :per_page => 12)
  end

  def show
    @album = Album.find(params[:album_id])
    @photo = @album.photos.find(params[:id])
  end
  
end