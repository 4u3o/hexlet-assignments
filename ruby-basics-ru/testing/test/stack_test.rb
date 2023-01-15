# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/stack'

class StackTest < Minitest::Test
  # BEGIN
  def setup
    @stack = Stack.new

    @stack.push! 'ruby'
    @stack.push! 'php'
  end

  def test_that_stack_initiated_well
    assert { @stack.to_a == %w[ruby php] }
  end

  def test_that_push_wild_change_stack_size
    expect = 2

    assert { @stack.size == expect }
  end

  def test_that_stack_is_not_empty_after_push
    expect = false

    assert { @stack.empty? == expect }
  end

  def test_that_pop_returns_correct_value
    expect = 'php'

    result = @stack.pop!

    assert { result == expect }
  end

  def test_that_pop_change_stack_size
    size_before = @stack.size

    @stack.pop!

    assert { @stack.size != size_before }
  end

  def test_that_pop_can_empty_the_stack
    expect = true

    @stack.pop!
    @stack.pop!

    assert { @stack.empty? == expect }
  end
  # END
end

test_methods = StackTest.new({}).methods.select { |method| method.start_with? 'test_' }
raise 'StackTest has not tests!' if test_methods.empty?
