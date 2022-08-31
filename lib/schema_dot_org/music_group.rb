# frozen_string_literal: true

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
