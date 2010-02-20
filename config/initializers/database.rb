include MongoMapper
 
db_config = YAML::load(File.read(File.join(Rails.root, "/config/database.yml")))
 
if db_config[Rails.env] && db_config[Rails.env]['adapter'] == 'mongodb'
  mongo = db_config[Rails.env]
  MongoMapper.connection = Mongo::Connection.new(mongo['host'] || 'localhost',
                                                 mongo['port'] || 27017,
                                                :logger => Rails.logger)
  MongoMapper.database = "#{mongo['database']}-#{Rails.env}"
  
  if mongo['username'] && mongo['password']
    MongoMapper.database.authenticate(mongo['username'], mongo['password'])
  end
end
 
ActionController::Base.rescue_responses['MongoMapper::DocumentNotFound'] = :not_found
