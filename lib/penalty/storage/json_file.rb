require 'json'

module Penalty
  module Storage
    class JSONFile
      def initialize(filename)
        @filename = filename
      end

      def get_penalties
        Hash[load_penalties.map{|k, v| [k.to_i, v]}]
      end

      # TODO: Divide File storage and JSON storage
      def load_penalties
        JSON.parse(File.read(@filename))
      end
    end
  end
end
