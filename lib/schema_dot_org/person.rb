# frozen_string_literal: true

require 'schema_dot_org'
require 'schema_dot_org/thing'


module SchemaDotOrg
  # Model the Schema.org `Person`.  See http://schema.org/Person
  class Person < Thing
    validates :name, type: String, presence: true

    def _to_json_struct
      super
    end
  end
end
