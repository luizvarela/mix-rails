require 'mongo'

class GridfsController < ActionController::Metal
  def serve
    gridfs_path = env["PATH_INFO"].gsub("/files/", "")

    database_name        = Mongoid::Config.sessions[:default][:database]
    host_and_port   = Mongoid::Config.sessions[:default][:hosts][0].split(':')

    host            = host_and_port[0]
    port            = host_and_port[1]

    username        = Mongoid::Config.sessions[:default][:username]
    password        = Mongoid::Config.sessions[:default][:password]

    con = Mongo::MongoClient.new(host, port)
    
    if username
      con.add_auth(database_name, username, password)
    end
    
    db = con.db(database_name)

    gridfs_file = Mongo::GridFileSystem.new(db).open(gridfs_path, 'r')

    begin
      gridfs_file = Mongo::GridFileSystem.new(db).open(gridfs_path, 'r')
      self.response_body = gridfs_file.read
      self.content_type = gridfs_file.content_type
    rescue
      self.status = :file_not_found
      self.content_type = 'text/plain'
      self.response_body = ''
    end
  end
end