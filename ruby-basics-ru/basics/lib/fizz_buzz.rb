# frozen_string_literal: true

# BEGIN
def fizz_buzz(start, stop)
  return if start > stop

  result = []

  (start..stop).each do |num|
    if (num % 3).zero?
      next result << ((num % 5).zero? ? 'FizzBuzz' : 'Fizz')
    end
    next result << 'Buzz' if (num % 5).zero?

    result << num
  end

  result.join(' ')
end
# END
