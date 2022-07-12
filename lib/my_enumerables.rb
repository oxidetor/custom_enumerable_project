module Enumerable
  # Your code goes here

  def my_each_with_index
    index = 0
    until index == size
      yield(self[index], index)
      index += 1
    end
    self
  end

  def my_select
    matched_items = []
    index = 0
    until index == size
      matched_items << self[index] if yield(self[index])
      index += 1
    end
    matched_items
  end

  def my_all?
    index = 0
    until index == size
      return false unless yield(self[index])

      index += 1
    end
    true
  end

  def my_any?
    index = 0
    until index == size
      return true if yield(self[index])

      index += 1
    end
    false
  end

  def my_none?
    index = 0
    until index == size
      return false if yield(self[index])

      index += 1
    end
    true
  end

  def my_count
    return size unless block_given?

    count = 0
    index = 0
    until index == size
      count += 1 if yield(self[index])

      index += 1
    end
    count
  end

  def my_map(&function)
    new_arr = []
    index = 0
    until index == size
      new_arr << function.call(self[index])

      index += 1
    end
    new_arr
  end

  def my_inject(initializer, &function)
    accumulator = initializer
    index = 0
    until index == size
      accumulator = function.call(accumulator, self[index])

      index += 1
    end
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
    index = 0
    until index == size
      yield(self[index])
      index += 1
    end
    self
  end
end
