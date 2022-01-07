# frozen_string_literal: true

# The Enumerable module
module Enumerable
  def my_each
    return to_enum unless block_given?

    for item in self do
      yield item
    end
    self
  end

  def my_each_with_index
    return enum_for unless block_given?

    i = 0
    my_each do |item|
      yield item, i
      i += 1
    end
    self
  end

  def my_select
    value = []
    my_each do |item|
      value.append(item) if yield(item)
    end
    value
  end

  def my_all?
    my_each do |item|
      return false unless yield(item)
    end
    true
  end

  def my_any?
    my_each do |item|
      return true if yield(item)
    end
    false
  end

  def my_none?
    return true unless my_any? { |item| yield(item) }

    false
  end

  def my_count
    count = 0
    my_each do |item|
      count += 1 if yield(item)
    end
    count
  end

  def my_map
    sum = []
    my_each do |item|
      sum.push yield(item)
    end
    sum
  end

  def my_inject(sum = 0)
    my_each do |item|
      sum = yield(sum, item)
    end
    sum
  end
end
