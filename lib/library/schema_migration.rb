require 'active_record'

module Library
  class SchemaMigration < ActiveRecord::SchemaMigration

    self.table_name_prefix = 'library_'

  end
end
