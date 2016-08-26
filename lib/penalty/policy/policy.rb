module Penalty
  module Policy
    module Base
      def self.included(base)
        base.extend ClassMethods
      end

      module ClassMethods
        %w(first second third).each do |level|
          define_method "#{level}_level_penalty" do |*args|
            define_method "#{level}_level" do
              -> (client) { args.any? {|a| a == client} }
            end
          end
        end
      end

      def call(client)
        case client
        when first_level then 0
        when second_level then 1
        when third_level then 2
        else raise ArgumentError, "No Policy for client = #{client}"
        end
      end
    end
  end
end
