module Penalty
  module Storage
    class Default
      def initialize
        @penalties = {
          0 => [[20, 18.57], [10, 8.57], [50, 42.8]],
          1 => [[18.57, 17.14], [8.57, 7.14], [42.8, 35.7]],
          2 => [[17.14, 15.71], [7.14, 5.71], [35.7, 28.6]],
          3 => [[15.71, 14.28], [5.71, 4.28], [28.6, 21.5]],
          4 => [[14.28, 12.85], [4.28, 2.85], [21.5, 14.38]],
          5 => [[12.85, 11.42], [2.85, 1.42], [14.38, 7.14]],
          6 => [[11.42, 0], [1.42, 0], [7.14, 0]]
        }
      end

      def get_penalties
        @penalties
      end
    end
  end
end