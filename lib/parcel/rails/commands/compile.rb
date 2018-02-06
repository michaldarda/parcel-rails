# frozen_string_literal: true

module Parcel
  module Rails
    module Commands
      class Compile
        def initialize(assets:, destination:)
          @assets = assets
          @destination = destination
        end

        def call
          output = `parcel build #{@assets.join(' ')} -d #@destination`
          puts output
        end
      end
    end
  end
end
