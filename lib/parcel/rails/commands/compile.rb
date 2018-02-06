# frozen_string_literal: true

class Parcel::Rails::Commands::Compile
  def initialize(assets)
    @assets = assets
  end

  def call
    output = `parcel build #{@assets.join(' ')} -d public/parcels`
    puts output
  end
end
