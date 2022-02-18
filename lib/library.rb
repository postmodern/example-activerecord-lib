require 'active_record'

module Library
  DEFAULT_DATABASE = {
    adapter:  'sqlite3',
    database: 'database.sqlite3'
  }

  def self.connect(database=DEFAULT_DATABASE)
    ActiveRecord::Base.establish_connection(database)

    require_relative 'library/migrations'
    Migrations.migrate_up

    require_relative 'library/models'
    MODELS.each(&:connection)
  end
end
