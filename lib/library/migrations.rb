require 'active_record'

module Library
  module Migrations
    # The path to the `migrations/` directory.
    DIR = File.join(__dir__,'migrations')

    def self.context
      @context ||= ActiveRecord::MigrationContext.new([DIR])
    end

    def self.migrate(target_version=nil)
      context.migrate(target_version)
    end

    def self.migrate_up(target_version=nil)
      context.up(target_version)
    end

    def self.migrate_down(target_version=nil)
      context.down(target_version)
    end
  end
end
