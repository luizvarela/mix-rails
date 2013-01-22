class Admix::PhotosController < Admix::InheritedController
  
  before_filter :image_param

  polymorphic_belongs_to :album, param: :album_id

  # load_and_authorize_resource :album
  # load_and_authorize_resource :photo, :through => :album_id
  skip_load_and_authorize_resource

  respond_to :json

  def upload
    render inline: params.to_s
  end

  def image_param
    if params[:image]
      params[:photo] = { image: params[:image] }
    end
  end


end