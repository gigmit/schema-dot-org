# frozen_string_literal: true

require 'schema_dot_org'
require 'schema_dot_org/thing'

module SchemaDotOrg
  # Model the Schema.org `Thing > Place`.  See http://schema.org/Place
  class Place < Thing
    attr_accessor :address
    validates :address, type: String, allow_nil: true

    def _to_json_struct
      super.merge(
        'address' => address
      )
    end
  end
end
