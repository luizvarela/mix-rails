class Admix::PhotosController < Admix::AdmixController
  
  respond_to :json
  respond_to :html, :only => [:upload, :index, :destroy]

  inherit_resources

  before_filter :image_param

  polymorphic_belongs_to :album, param: :album_id

  # load_and_authorize_resource :album
  # load_and_authorize_resource :photo, :through => :album_id
  skip_load_and_authorize_resource

  def destroy
   album = Album.find(params[:album_id])
   photo = album.photos.find(params[:id])
   photo.destroy
   return render :json => photo
  end

  def upload
    render inline: params.to_s
  end

  def image_param
    if params[:image]
      params[:photo] = { image: params[:image] }
    end
  end


end