module Parcel
  module Rails
    module ViewHelpers
      def javascript_parcel_tag(source)
        # TODO: AFAIR Rails 5 introduced Mime['js'] syntax, previous versions uses Mime::JS syntax
        content_tag("script", "", { "type" => Mime['js'], "src" => parcel_path(source) })
      end

      private

      def parcel_path(source)
        source = "#{source}.js"
        directory = ::Rails.application.config.parcel.destination.gsub('public/', '')
        Pathname.new(directory).join(source).to_s
      end
    end
  end
end
