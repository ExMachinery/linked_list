require_relative 'Node'

class Linked_List
  attr_accessor :name
  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    if @head == nil
      @head = Node.new(value, nil)
      @tail = @head
    else
      @tail.next_node = Node.new(value, nil)
      @tail = @tail.next_node
    end
  end

  def prepend(value)
    if @head == nil
      @head = Node.new(value, nil)
      @tail = @head
    else
      proxy_var = Node.new(value, @head)
      @head = proxy_var
    end  
  end

  def size
    return nil if @head == nil
    counter = 1
    current = @head
    until current.next_node == nil
      counter += 1
      current = current.next_node
    end 
    counter
  end

  def head
    return nil if @head == nil
    return @head.value
  end

  def tail
    return nil if @tail == nil
    return @tail.value
  end

  def at(index)
    return nil if @head == nil
    result = 0
    abort = false
    current = @head
    until index < 0 || abort
      result = current.value
      abort = true if current.next_node == nil && index != 0
      current = current.next_node
      index -= 1
    end
    return nil if abort
    result
  end

  def pop
    return nil if @head == nil
    result = @head.value
    @head = @head.next_node
    result
  end

  def contains?(value)
    return nil if @head == nil
    result = nil
    current = @head
    while result == nil
      if current.value == value
        result = true
      elsif current.next_node == nil
        result = false
      end
      current = current.next_node
    end
    result
  end

  def index(value)
    return nil if @head == nil
    current_index = 0
    result = nil
    current_node = @head
    abort = false
    until abort
      if current_node.value == value
        abort = true
        result = current_index
      elsif current_node.next_node == nil
        abort = true
      else
        current_node = current_node.next_node
      end
      current_index += 1
    end
    result
  end

  def to_s
    return "" if @head == nil
    array_of_values = Array.new
    current = @head
    abort = false
    until abort
      array_of_values << current.value
      if current.next_node
        current = current.next_node
      else
        abort = true
      end
    end

    array_of_string_values = Array.new
    array_of_values.each {|value| array_of_string_values << "( #{value} )"}
    return array_of_string_values.join(" -> ")
  end

  def insert_at(index, *values)
    left_node = @head
    until index == 1
      raise IndexError, "Index out of bounds" if left_node == nil
      left_node = left_node.next_node
      index -= 1
    end
    right_node = left_node.next_node
    values.each do |value|
      left_node.next_node = Node.new(value, right_node)
      left_node = left_node.next_node
    end
  end

  def remove_at(index)
    current = @head
    until index == 1
      raise IndexError, "Index out of bounds" if current == nil
      left_node = current if index == 2
      current = current.next_node
      index -= 1
    end
    left_node.next_node = current.next_node
  end

end