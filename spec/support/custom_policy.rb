class CustomPolicy
  include Penalty::Policy::Base

  first_level_penalty '4'
  second_level_penalty '1', '2'
  third_level_penalty '3', '5'
end
