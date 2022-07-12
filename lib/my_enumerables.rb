module Enumerable
  # Your code goes here

  def my_each_with_index
    index = 0
    for el in self do
      yield(el, index)
      index += 1
    end
    self
  end

  def my_select
    matched_items = []
    my_each { |el| matched_items << el if yield(el) }
    matched_items
  end

  def my_all?
    my_each { |el| return false unless yield(el) }
    true
  end

  def my_any?
    my_each { |el| return true if yield(el) }
    false
  end

  def my_none?
    my_each { |el| return false if yield(el) }
    true
  end

  def my_count
    return size unless block_given?

    count = 0
    my_each { |el| count += 1 if yield(el) }
    count
  end

  def my_map(&function)
    new_enum = []
    my_each { |el| new_enum << function.call(el) }
    new_enum
  end

  def my_inject(initializer, &function)
    accumulator = initializer
    my_each { |el| accumulator = function.call(accumulator, el) }
    accumulator
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for el in self do
      yield(el)
    end
    self
  end
end
