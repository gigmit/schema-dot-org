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
    validates :image, type: String, presence: true
    validates :same_as, type: String, presence: true
    validates :description, type: String, presence: true

    def _to_json_struct
      {
        'name' => self.name,
        'image' => self.image,
        'sameAs' => self.same_as,
        'description' => self.description
      }
    end
  end
end
