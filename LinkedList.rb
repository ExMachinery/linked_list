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
    # Thinking...
  end

end

# Я могу хранить первую ноду в @head, а все последующие в @next самой ноды, создавая цепочку. Так и работает Linked list,
# Не нужны массивы и хэши