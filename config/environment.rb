require 'bundler'
require 'pry'
require 'paint'

Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')

<<<<<<< HEAD
=======
old_logger = ActiveRecord::Base.logger
>>>>>>> stations
ActiveRecord::Base.logger = nil

require_all 'lib'

require_all 'app'
