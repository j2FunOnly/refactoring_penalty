module Penalty
  module Policy
    class Default
      include Base

      first_level_penalty '1', '2'
      second_level_penalty '3', '5'
      third_level_penalty '4'
    end
  end
end
