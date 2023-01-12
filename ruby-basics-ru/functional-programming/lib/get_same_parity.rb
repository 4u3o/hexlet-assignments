# frozen_string_literal: true

# BEGIN
def get_same_parity(nums)
  return [] if nums.empty?

  flag = nums.first.even? ? :even? : :odd?
  nums.filter(&flag)
end
# END
