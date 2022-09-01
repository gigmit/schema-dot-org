# frozen_string_literal: true

module SchemaDotOrg
  # Model the Schema.org `City`.  See http://schema.org/City
  class City < Place
    def _to_json_struct
      super
    end
  end
end
