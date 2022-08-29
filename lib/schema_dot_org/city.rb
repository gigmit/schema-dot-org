# frozen_string_literal: true

require 'schema_dot_org'
require 'schema_dot_org/place'

module SchemaDotOrg
  # Model the Schema.org `City`.  See http://schema.org/City
  class City < Place
    def _to_json_struct
      super
    end
  end
end
