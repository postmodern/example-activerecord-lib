require_relative 'schema_migration'

module Library
  class MigrationContext < ActiveRecord::MigrationContext

    MIGRATIONS_DIR = File.join(__dir__,'migrations')

    def initialize
      super(MIGRATIONS_DIR,Library::SchemaMigration)
    end

  end
end
