# frozen_string_literal: true

module Parcel
  module Rails
    module Commands
      class Lookup
        def initialize(entry_points:, paths:)
          @entry_points = entry_points
          @paths = paths
        end

        def call
          @paths.map do |path|
            result = Dir.glob("#{path}/*").select do |f|
              @entry_points.any? { |asset| f.end_with?(asset) }
            end
          end.flatten
        end
      end
    end
  end
end
