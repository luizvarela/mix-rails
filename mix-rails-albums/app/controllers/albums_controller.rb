class AlbumsController < ApplicationController
  
  def index
    @albums = Album.published.paginate(:page => params[:page], :per_page => 12)
    # @albums.each do |a|
    #   a.photos.each do |p|
    #     p.image.recreate_versions!
    #   end
    # end

  end

  def show
    @album = Album.find(params[:id])
  end

  

end