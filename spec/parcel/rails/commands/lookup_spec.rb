# frozen_string_literal: true

RSpec.describe Parcel::Rails::Commands::Lookup do
  it 'lookups assets to be compiled in given paths' do
    paths = [FIXTURES_DIR.join('simple_js_project')]
    entry_points = %w(index.js)

    assets = Parcel::Rails::Commands::Lookup.new(paths: paths, entry_points: entry_points).call

    expect(assets).to eq ['spec/fixtures/simple_js_project/index.js']
  end
end
