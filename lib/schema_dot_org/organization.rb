# frozen_string_literal: true

require 'date'
require 'schema_dot_org'
require 'schema_dot_org/thing'
require 'schema_dot_org/person'
require 'schema_dot_org/place'
require 'schema_dot_org/postal_address'

module SchemaDotOrg
  class Organization < Thing
    attr_accessor :email,
                  :founder,
                  :founding_date,
                  :founding_location,
                  :logo,
                  :address,
                  :keywords

    validates :email, type: String, allow_nil: true
    validates :founder, type: SchemaDotOrg::Person, allow_nil: true
    validates :founding_date, type: Date, allow_nil: true
    validates :founding_location, type: SchemaDotOrg::Place, allow_nil: true
    validates :logo, type: String, allow_nil: true
    validates :address, type: SchemaDotOrg::PostalAddress, allow_nil: true
    validates :keywords, type: String, allow_nil: true

    def _to_json_struct
      super.merge(
        'logo' => logo,
        'founder' => founder&.to_json_struct,
        'foundingDate' => founding_date&.to_s,
        'foundingLocation' => founding_location&.to_json_struct,
        'address' => address&.to_json_struct,
        'keywords' => keywords
      )
    end
  end
end
