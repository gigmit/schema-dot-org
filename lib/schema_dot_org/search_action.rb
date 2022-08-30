# frozen_string_literal: true

require 'schema_dot_org'
require 'schema_dot_org/thing'

module SchemaDotOrg
  # Model the Schema.org `Thing > SearchAction`.  See http://schema.org/SearchAction
  class SearchAction < Thing
    attr_accessor :target, :query_input
    validates :target,      type: String, presence: true
    validates :query_input, type: String, presence: true

    def _to_json_struct
      super.merge(
        'target' => target,
        'query-input' => query_input
      )
    end
  end
end
