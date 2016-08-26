module Penalty
  module Table
    def penalty_table
      @table ||= config.storage.get_penalties
    end
  end
end
