require 'active_record'


options = {
  adapter: 'postgresql',
  database: 'share_aupair',
  username: 'will'
}

ActiveRecord::Base.establish_connection( ENV['DATABASE_URL'] || options)
