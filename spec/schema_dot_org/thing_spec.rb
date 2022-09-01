# frozen_string_literal: true

require 'spec_helper'

RSpec.describe SchemaDotOrg::Thing do # rubocop:disable Metrics/BlockLength
  describe "#new" do
    it 'will create a Thing without attributes' do
      expect { SchemaDotOrg::Thing.new }.not_to raise_error(ArgumentError)
    end

    it 'raise an error with unknown attributes' do
      expect { SchemaDotOrg::Thing.new(gizzverse: 'confirmed') }.to raise_error(NoMethodError)
    end

    it 'creates a Thing when given known attributes' do
      expect do
        SchemaDotOrg::Thing.new(
          id: 'wwww.gigmit.com/al-mudawwar',
          name: 'Al-Mudawwar',
          image: 'image-url',
          same_as: ['https://open.spotify.com/artist/1Zd6VFfOVh04zXMVpK96Xy?si=kf0gpl3DTKOs2fNoi62E8g'],
          description: 'recording project',
          url: 'wwww.gigmit.com/al-mudawwar'
        )
      end.to_not raise_error
    end
  end


  describe "#to_json_struct" do
    it "has exactly the correct attributes and values" do
      action = SchemaDotOrg::Thing.new(
        id: 'wwww.gigmit.com/al-mudawwar',
        name: 'Al-Mudawwar',
        image: 'image-url',
        same_as: ['https://open.spotify.com/artist/1Zd6VFfOVh04zXMVpK96Xy?si=kf0gpl3DTKOs2fNoi62E8g'],
        description: 'recording project',
        url: 'wwww.gigmit.com/al-mudawwar'
      )

      expect(action.to_json_struct).to eq(
        '@type' => 'Thing',
        '@id' => 'wwww.gigmit.com/al-mudawwar',
        'name' => 'Al-Mudawwar',
        'image' => 'image-url',
        'sameAs' => 'https://open.spotify.com/artist/1Zd6VFfOVh04zXMVpK96Xy?si=kf0gpl3DTKOs2fNoi62E8g',
        'description' => 'recording project',
        'url' => 'wwww.gigmit.com/al-mudawwar'
      )
    end

    it 'creates multiple sameAs entries' do
      action = SchemaDotOrg::Thing.new(
        id: 'wwww.gigmit.com/al-mudawwar',
        name: 'Al-Mudawwar',
        same_as: [
          'https://open.spotify.com/artist/1Zd6VFfOVh04zXMVpK96Xy?si=kf0gpl3DTKOs2fNoi62E8g',
          'https://open.spotify.com/artist/1Zd6VFfOVh04zXMVpK96Xy?si=kf0gpl3DTKOs2fNoi62E8g',
          'different link'
        ]
      )

      expect(action.to_json_struct).to eq(
        '@type' => 'Thing',
        '@id' => 'wwww.gigmit.com/al-mudawwar',
        'name' => 'Al-Mudawwar',
        'sameAs' => 'https://open.spotify.com/artist/1Zd6VFfOVh04zXMVpK96Xy?si=kf0gpl3DTKOs2fNoi62E8g',
        'sameAs' => 'https://open.spotify.com/artist/1Zd6VFfOVh04zXMVpK96Xy?si=kf0gpl3DTKOs2fNoi62E8g',
        'sameAs' => 'different link'
      )
    end
  end
end
