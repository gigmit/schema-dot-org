# frozen_string_literal: true

require 'schema_dot_org'

module SchemaDotOrg
  # Model the Schema.org `Thing`.  See http://schema.org/Thing
  class Thing < SchemaType
    attr_accessor :name,
                  :image,
                  :same_as,
                  :description

    validates :name, type: String, presence: true
    validates :image, type: String, allow_nil: true
    validates :same_as, type: String, allow_nil: true
    validates :description, type: String, allow_nil: true

    def _to_json_struct
      {
        'name' => name,
        'image' => image,
        'sameAs' => same_as,
        'description' => description
      }
    end
  end
end
