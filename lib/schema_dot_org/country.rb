# frozen_string_literal: true

module SchemaDotOrg
  # Model the Schema.org `Country`.  See http://schema.org/Country
  class Country < Thing
    def _to_json_struct
      super
    end
  end
end
