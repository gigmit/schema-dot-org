# frozen_string_literal: true

module SchemaDotOrg
  # Model the Schema.org `Thing > CreativeWork > WebSite`.
  # @See http://schema.org/WebSite
  class WebSite < Thing
    attr_accessor :potential_action

    validates :potential_action, type: SchemaDotOrg::SearchAction, allow_nil: true

    def _to_json_struct
      super.merge(
        'potentialAction' => potential_action&.to_json_struct
      )
    end
  end
end
