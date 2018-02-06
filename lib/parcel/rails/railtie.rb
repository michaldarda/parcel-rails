module Parcel
  module Rails
    class Railtie < Rails::Railtie
      rake_tasks do
        load 'parcel/rails/tasks.rake'
      end
    end
  end
end
