# frozen_string_literal: true

RSpec.describe Parcel::Rails::Commands::Compile do
  before do
    FileUtils.rm_rf(PUBLIC_PARCELS_DIR)
    FileUtils.rm_rf(CACHE_DIR)
    FileUtils.mkdir_p(PUBLIC_PARCELS_DIR)
  end

  it 'compiles all given assets' do
    asset = [FIXTURES_DIR.join('simple_js_project', 'index.js')]

    Parcel::Rails::Commands::Compile.new(assets: [asset], destination: PUBLIC_PARCELS_DIR).call

    expect(File.exist?(PUBLIC_PARCELS_DIR.join('index.js'))).to eq true
  end
end
