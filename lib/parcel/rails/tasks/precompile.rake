namespace :parcel do
  namespace :assets do
    task :precompile do
      parcel_config = Rails.config.parcel
      `parcel #{parcel_config.entry_points.join(' ')} -d public/parcels`
    end
  end
end
