# frozen_string_literal: true

require 'schema_dot_org'
require 'schema_dot_org/thing'
require 'schema_dot_org/postal_address'

module SchemaDotOrg
  # Model the Schema.org `MusicEvent`.  See http://schema.org/MusicEvent
  class MusicEvent < Thing
    attr_accessor :start_date,
                  :location

    validates :start_date, type: Date, presence: true
    validates :location, type: SchemaDotOrg::PostalAddress, presence: true

    def _to_json_struct
      super.merge(
        'startDate' => start_date.to_s,
        'location' => location.to_json_struct
      )
    end
  end
end
