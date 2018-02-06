# frozen_string_literal: true

require_relative 'parcel/rails/commands/compile'

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
              config = ::Rails.application.config.parcel
              assets = Parcel::Rails::Commands::Lookup.new(paths: config.paths, entry_points: config.entry_points).()
              Parcel::Rails::Commands::Compile.new(assets: assets, destination: config.destination).()
            end
          end
        end

        config.parcel = ActiveSupport::OrderedOptions.new
        config.parcel.paths = %w(app/javascript)
        config.parcel.entry_points = %w(application.js)
        config.parcel.destination = %w(public/)
      end
    end
  end
end

require 'parcel/rails/version'
require 'parcel/rails/commands/lookup'
require 'parcel/rails/commands/compile'
