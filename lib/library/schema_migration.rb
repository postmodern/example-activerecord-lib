require 'active_record'

module Library
  class SchemaMigration < ActiveRecord::SchemaMigration

    self.table_name = 'library_schema_migration'

  end
end
