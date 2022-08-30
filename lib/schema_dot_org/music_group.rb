# frozen_string_literal: true

require 'schema_dot_org'
require 'schema_dot_org/city'
require 'schema_dot_org/country'
require 'schema_dot_org/organization'

module SchemaDotOrg
  # Model the Schema.org `MusicGroup`.  See http://schema.org/MusicGroup
  class MusicGroup < Organization
    attr_accessor :genre

    validates :genre, type: String, presence: true

    def _to_json_struct
      super.merge(
        'genre' => genre
      )
    end
  end
end
