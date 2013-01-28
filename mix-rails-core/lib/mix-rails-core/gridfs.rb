module MixRailsCore
  module Gridfs

    mattr_accessor :read_file

    def self.read_file(filepath)
      gridfs_path = filepath.gsub("/files/", "")

      database_name   = Mongoid::Config.sessions[:default][:database]
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
      
      gridfs_file

    end
  end
end