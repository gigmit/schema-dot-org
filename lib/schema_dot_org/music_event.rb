# frozen_string_literal: true

module SchemaDotOrg
  # Model the Schema.org `MusicEvent`.  See http://schema.org/MusicEvent
  class MusicEvent < Thing
    attr_accessor :start_date,
                  :location,
                  :keywords

    validates :start_date, type: Date, presence: true
    validates :location, type: SchemaDotOrg::PostalAddress, presence: true
    validates :keywords, type: String, allow_nil: true

    def _to_json_struct
      super.merge(
        'startDate' => start_date.to_s,
        'location' => location.to_json_struct,
        'keywords' => keywords
      )
    end
  end
end
