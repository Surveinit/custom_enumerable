module Enumerable
  # Your code goes here
  # MY ALL
  def my_all?
    results = []
    self.my_each do |element|
      results << element if yield(element) 
    end

    if results.length == self.length
      return true
    else
      return false
    end

  end

  def my_any?
    self.my_each do |element|
      return true if yield(element)      
    end
    return false

  end

  def my_count
    if block_given?
      count = 0
      self.my_each do |element|
      count += 1 if yield(element) 
      end
      return count
    
    else
    count = 0
    self.my_each do
      count += 1
    end
    return count
    end

  end

  def my_each_with_index
    index = 0
    if block_given?
      self.each do |element|
        yield(element, index)
        index += 1
      end
    end
  end

  def my_inject(initial_value)
    sum = initial_value
    if block_given?
      self.each do |element|
        sum = yield(sum, element)
      end
      return sum
    end
  end 

  def my_map
    result = []
    if block_given?
      self.each do |element|
        result << yield(element)
      end
      return result
    end
  end

  def my_none?
    self.my_each do |element|
      return false if yield(element)      
    end
    return true 
  end

  def my_select
    result = []
    if block_given?
      self.each do |element|
        result << element if yield(element)
      end
      return result
    end
  end





end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    if block_given?
      i = 0
      until i == self.length do 
        yield(self[i])
        i += 1
      end
    end
    return self
  end
end
