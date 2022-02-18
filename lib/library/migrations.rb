require_relative 'migration_context'

module Library
  module Migrations
    def self.migrate(target_version=nil)
      MigrationContext.new.migrate(target_version)
    end

    def self.migrate_up(target_version=nil)
      MigrationContext.new.up(target_version)
    end

    def self.migrate_down(target_version=nil)
      MigrationContext.new.down(target_version)
    end
  end
end
