# frozen_string_literal: true

require 'parcel/rails/version'
require 'parcel/rails/runner'

module Parcel
  # Parceljs integration with Rails
  module Rails
    if defined?(::Rails)
      module Rails
        class Application
          attr_accessor :parcel
        end
      end

      class Railtie < ::Rails::Railtie
        railtie_name :parcel

        rake_tasks do
          namespace :parcel do
            desc 'Compiles assets using parcel bundler'
            task :compile do
              Parcel::Rails::Runner.from_config.compile
            end
          end
        end

        config.parcel = ActiveSupport::OrderedOptions.new
        config.parcel.entry_points = %w(app/javascript/application.js)
        config.parcel.destination = 'public/parcels'
      end
    end
  end
end
