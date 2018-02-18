class ParcelGenerator < Rails::Generators::Base
  desc "Generate parce-rails initializer"

  def create_initializer_file
    initializer "parcel.rb" do
      %{Rails.application.config.parcel do |parcel|
  parcel.entry_points = %w(app/javascript/application.js)
  parcel.destination = 'public/parcels'
end}
    end
  end
end
