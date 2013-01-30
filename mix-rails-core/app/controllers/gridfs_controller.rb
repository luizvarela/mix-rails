require 'mongo'
require 'mix-rails-core/gridfs'

class GridfsController < ActionController::Metal
  def serve
      
      

    begin
      
      file_dir =  File.expand_path '../', "#{Rails.root.join('public')}#{env['PATH_INFO']}"
      Dir.mkdir file_dir unless Dir.exists?(file_dir)
      gridfs_file = MixRailsCore::Gridfs::read_file(env["PATH_INFO"])
      tmp_file_name = "#{Rails.root.join('public')}#{env['PATH_INFO']}"
      file_content = gridfs_file.read
      File.open(tmp_file_name, 'wb') do |f|
        f.write(file_content)
        f.close
      end

      self.response_body = file_content

      self.content_type = gridfs_file.content_type
    rescue
      self.status = :not_found
      self.content_type = 'text/plain'
      self.response_body = ''
    end
  end
end