# frozen_string_literal: true

namespace :parcel do
  desc 'Compiles assets using parcel bundler'
  task :compile do
    Parcel::Rails::Runner.from_config.compile
  end

  desc 'Compiles assets using parcel bundler'
  task :serve do
    Parcel::Rails::Runner.from_config.serve
  end
end

Rake::Task['assets:precompile'].enhance do
  Rake::Task['parcel:compile'].invoke
end
