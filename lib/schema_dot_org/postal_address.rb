# frozen_string_literal: true

require 'schema_dot_org'
require 'schema_dot_org/thing'

module SchemaDotOrg
  # Model the Schema.org `PostalAddress`.  See http://schema.org/PostalAddress
  class PostalAddress < Thing
    attr_accessor :address_country,
                  :address_locality,
                  :street_address,
                  :postal_code

    validates :address_country, type: SchemaDotOrg::Country, presence: true
    validates :address_locality, type: String, presence: true
    validates :street_address, type: String, allow_nil: true
    validates :postal_code, type: String, allow_nil: true

    def _to_json_struct
      super.merge(
        'streetAddress' => street_address,
        'postalCode' => postal_code,
        'addressLocality' => address_locality,
        'addressCountry' => address_country.to_json_struct
      )
    end
  end
end
