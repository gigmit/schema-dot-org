# frozen_string_literal: true

require 'spec_helper'

RSpec.describe SchemaDotOrg::MusicEvent do # rubocop:disable Metrics/BlockLength
  describe "#new" do
    context 'without errors' do
      it 'creates a MusicEvent without attributes' do
        expect { SchemaDotOrg::MusicEvent.new }.not_to raise_error(ArgumentError)
      end

      it 'creates a MusicEvent with correct attributes' do
        expect do
          SchemaDotOrg::MusicEvent.new(
            start_date: Date.today,
            location: SchemaDotOrg::PostalAddress.new,
            keywords: 'concert'
          )
        end.not_to raise_error
      end
    end

    context 'with errors' do
      it 'does not create MusicEvent with wrong typed attributes' do
        expect do
          SchemaDotOrg::MusicEvent.new(
            start_date: Date.today,
            location: 'address',
            keywords: 'concert'
          )
        end.to raise_error(ArgumentError)
      end
    end
  end

  describe "#to_json_struct" do
    it "has exactly the correct attributes and values" do
      action = SchemaDotOrg::MusicEvent.new(
        start_date: Date.today,
        location: SchemaDotOrg::PostalAddress.new,
        keywords: 'concert'
      )

      expect(action.to_json_struct).to eq(
        '@type' => 'MusicEvent',
        'startDate' => Date.today.to_s,
        'location' => { '@type' => 'PostalAddress' },
        'keywords' => 'concert'
      )
    end
  end
end
