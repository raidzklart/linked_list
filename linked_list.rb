class Node
  attr_reader :value  
  attr_accessor :next_node
  def initialize(value=nil, next_node=nil)
    @value = value
    @next_node = next_node
  end
end

class LinkedList
  def initialize
    @head = nil
    @size = 0
  end

  def append(value)
    if @tail
      @tail.next_node = Node.new(value) 
      @tail = @tail.next_node
    else
      @tail = Node.new(value)
    end
    @head = @tail unless @head
    @size += 1
    self
  end

  def prepend(value)
    new_head = Node.new(value, @head)
    @head = new_head
    @tail = @head if @head.nil?
    @size += 1
    self
  end

  def size
    @size
  end

  def head
    @head
  end

  def tail
    @tail
  end

  def at(index)
    current = @head
    current_index = 0
    until current_index == index
      return nil if current.nil?
      
      current = current.next_node
      current_index += 1
    end
      current
  end

  def pop
    if @head.next_node.nil?
      @head = nil 
      @tail = nil
      @size = 0
      return
    end
    current = @head
    unless current.next_node.nil?
      until current.next_node == @tail
        current = current.next_node
      end
      current.next_node = nil
      @tail = current
      @size -= 1
      self
    end
  end

  def contains?(value)
    current = @head
    until current.nil?
      if current.value == value
        return true
      end
      current = current.next_node
    end
    false
  end

  def find(data)
    current = @head
    index = 0
    until current.nil?
      return index if current.value == data
      index += 1
      current = current.next_node
    end
    nil
  end

  def to_s
    current = @head
    str = ""
    until current.nil?
      str += "(#{current.value}) -> "
      current = current.next_node
    end
    str += "nil"
  end

  def insert_at(index, value)
    if index == 0
      self.prepend(value)
    elsif index > @size
      self.append(value)
    else
      before = self.at(index-1)
      after = self.at(index)
      new_node = Node.new(value,after)
      before.next_node = new_node
    end
    self
  end

  def remove_at(index)
    if index == 0 
      @head = @head.next_node
    elsif index +1 > @size
      return self
    else
      before = self.at(index-1)
      after = self.at(index+1)
      before.next_node = after
    end
    self
  end

end