# frozen_string_literal: true

module SchemaDotOrg
  # Model the Schema.org `Thing > SearchAction`.  See http://schema.org/SearchAction
  class SearchAction < Thing
    attr_accessor :target, :query
    validates :target,      type: String, presence: true
    validates :query, type: String, presence: true

    def _to_json_struct
      super.merge(
        'target' => target,
        'query' => query
      )
    end
  end
end
