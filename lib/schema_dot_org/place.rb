# frozen_string_literal: true

module SchemaDotOrg
  # Model the Schema.org `Thing > Place`.  See http://schema.org/Place
  class Place < Thing
    attr_accessor :address

    validates :address, type: SchemaDotOrg::PostalAddress, allow_nil: true

    def _to_json_struct
      super.merge(
        'address' => address&.to_json_struct
      )
    end
  end
end
