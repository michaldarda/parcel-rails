# frozen_string_literal: true

require 'parcel/rails/version'
require 'parcel/rails/runner'
require 'parcel/rails/view_helpers'

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

        initializer 'parcel.view_helpers' do
          ActionView::Base.send :include, ViewHelpers
        end

        rake_tasks do
          load 'parcel/rails/tasks.rake'
        end

        config.parcel = ActiveSupport::OrderedOptions.new
        config.parcel.entry_points = %w(app/javascript/application.js)
        config.parcel.destination = 'public/parcels'
      end
    end
  end
end
