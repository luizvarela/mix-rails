require 'mongo'
require 'mix-rails-core/gridfs'

class GridfsController < ActionController::Metal
  def serve
    
    begin
      gridfs_file = MixRailsCore::Gridfs::read_file(env["PATH_INFO"])
      self.response_body = gridfs_file.read
      self.content_type = gridfs_file.content_type
    rescue
      self.status = :not_found
      self.content_type = 'text/plain'
      self.response_body = ''
    end
  end
end