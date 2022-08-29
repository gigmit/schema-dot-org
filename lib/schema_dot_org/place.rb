# frozen_string_literal: true

require 'schema_dot_org'
require 'thing'

module SchemaDotOrg
  # Model the Schema.org `Thing > Place`.  See http://schema.org/Place
  class Place < Thing
    attr_accessor :address
    validates :address, type: String

    def _to_json_struct
      {
        'address' => address
      }
    end
  end
end
