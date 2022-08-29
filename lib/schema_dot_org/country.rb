# frozen_string_literal: true

require 'schema_dot_org'
require 'place'

module SchemaDotOrg
  # Model the Schema.org `Country`.  See http://schema.org/Country
  class Country < Place
    def _to_json_struct
      super
    end
  end
end
