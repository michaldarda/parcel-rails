module Parcel
  module Rails
    class Runner
      def self.from_command_line(args)
        return from_config if args.empty?
        new(args)
      end

      def self.from_config
        to_args(::Rails.application.config.parcel)
      end

      def self.to_args(config)
        new([*config.entry_points, '-d', config.destination])
      end

      def initialize(args)
        @args = args
      end

      def compile
        parcel_commmand(:build)
      end

      def watch
        parcel_commmand
      end

      private

      def parcel_commmand(cmd = '')
        output = `parcel #{cmd} #{@args.join(' ')}`
        puts output
      end
    end
  end
end
