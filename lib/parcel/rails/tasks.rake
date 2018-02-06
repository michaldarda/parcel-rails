# frozen_string_literal: true

require_relative 'commands/compile'

namespace :parcel do
  namespace :assets do
    task :precompile do
      Parcel::Rails::Commands::Compile.new(Rails.config.parcel.assets).()
    end
  end
end
