# frozen_string_literal: true

require 'spec_helper'

RSpec.describe SchemaDotOrg::PostalAddress do # rubocop:disable Metrics/BlockLength
  describe "#new" do
    context 'without errors' do
      it 'creates a PostalAddress without attributes' do
        expect { SchemaDotOrg::PostalAddress.new }.not_to raise_error(ArgumentError)
      end

      it 'creates a PostalAddress with correct attributes' do
        expect do
          SchemaDotOrg::PostalAddress.new(
            address_country: SchemaDotOrg::Country.new(name: 'PT'),
            address_locality: 'Almodovar',
            street_address: 'Maldonado',
            postal_code: '7700'
          )
        end.not_to raise_error
      end
    end

    context 'with errors' do
      it 'does not create PostalAddress with wrong typed attributes' do
        expect do
          SchemaDotOrg::PostalAddress.new(
            address_country: 'PT',
            address_locality: ['Almodovar']
          )
        end.to raise_error(ArgumentError)
      end
    end
  end

  describe "#to_json_struct" do
    it "has exactly the correct attributes and values" do
      action = SchemaDotOrg::PostalAddress.new(
        address_country: SchemaDotOrg::Country.new(name: 'PT'),
        address_locality: 'Almodovar',
        street_address: 'Maldonado',
        postal_code: '7700'
      )

      expect(action.to_json_struct).to eq(
        '@type' => 'PostalAddress',
        'addressLocality' => 'Almodovar',
        'addressCountry' => { '@type' => 'Country', 'name' => 'PT' },
        'streetAddress' => 'Maldonado',
        'postalCode' => '7700'
      )
    end
  end
end
