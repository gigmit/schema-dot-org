# frozen_string_literal: true

module SchemaDotOrg
  # Model the Schema.org `Thing`.  See http://schema.org/Thing
  class Thing < SchemaType
    attr_accessor :id,
                  :name,
                  :image,
                  :same_as,
                  :description,
                  :url

    validates :id, type: String, allow_nil: true
    validates :name, type: String, allow_nil: true
    validates :image, type: String, allow_nil: true
    validates :same_as, type: Array, allow_nil: true
    validates :description, type: String, allow_nil: true
    validates :url, type: String, allow_nil: true

    def _to_json_struct
      struct = {
        'name' => name,
        'image' => image,
        'description' => description,
        'url' => url
      }.compare_by_identity

      same_as&.each { |link| struct['sameAs'.dup] = link }
      struct
    end

    private

    def same_as_fields
      same_as&.map { |link| { 'sameAs' => link } }
    end
  end
end
