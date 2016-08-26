module Penalty
  module Table
    def penalty_table
      @table ||= get_penalties
    end

    def penalty_table!
      @table = get_penalties
    end

    private

    def get_penalties
      config.storage.get_penalties
    end
  end
end
