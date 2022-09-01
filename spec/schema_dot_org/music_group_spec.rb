# frozen_string_literal: true

require 'spec_helper'

RSpec.describe SchemaDotOrg::MusicGroup do # rubocop:disable Metrics/BlockLength
  describe "#new" do
    it 'will not create a MusicGroup without attributes' do
      expect { SchemaDotOrg::MusicGroup.new }.to raise_error(ArgumentError)
    end

    it 'creates a MusicGroup when given a genre' do
      expect do
        SchemaDotOrg::MusicGroup.new(
          genre: 'Cumbia'
        )
      end.to_not raise_error
    end
  end


  describe "#to_json_struct" do
    it "has exactly the correct attributes and values" do
      action = SchemaDotOrg::MusicGroup.new(
        genre: 'Cumbia'
      )

      expect(action.to_json_struct).to eq(
        'genre' => 'Cumbia',
        '@type' => 'MusicGroup'
      )
    end
  end
end
