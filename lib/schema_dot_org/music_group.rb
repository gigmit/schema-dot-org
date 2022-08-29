# frozen_string_literal: true

require 'schema_dot_org'
require 'schema_dot_org/city'
require 'schema_dot_org/country'
require 'schema_dot_org/organization'

module SchemaDotOrg
  # Model the Schema.org `MusicGroup`.  See http://schema.org/MusicGroup
  class MusicGroup < Organization
    attr_accessor :city,
                  :country,
                  :genre,
                  :keywords

    validates :city, type: SchemaDotOrg::City, presence: true
    validates :country, type: SchemaDotOrg::Country, presence: true
    validates :genre, type: String, presence: true
    validates :keywords, type: String, allow_nil: true

    def _to_json_struct
      super.merge(
        'city' => city.to_json_struct,
        'country' => country.to_json_struct,
        'genre' => genre,
        'keywords' => keywords
      )
    end
  end
end
