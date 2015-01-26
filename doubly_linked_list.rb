class Node
  attr_accessor :value, :next_node, :prev_node

  def initialize(value)
    @value = value
  end
end

class DoublyLinkedList
    def initialize(value)
      node = Node.new(value)
      @head = node
      @tail = node
    end

    def append(value)
      new_node = Node.new(value)
      @tail.next_node = new_node
      new_node.prev_node = @tail
      @tail = new_node
    end

    def prepend(value)
      new_node = Node.new(value)
      new_node.next_node = @head
      @head.prev_node = new_node
      @head = new_node
    end

##recursion
    def to_s(current_node=@head)
      return current_node.value if current_node.next_node.nil?
      return "#{current_node.value} > #{to_s(current_node.next_node)}"
    end

    def find(value,current_node=@head)
      return current_node if current_node.value == value
      find(value, current_node.next_node)
    end

    def insert_after(existing_node_value, new_node_value)
      if @tail.value == existing_node_value
        append(new_node_value)
      else
        existing_node = find(existing_node_value)
        new_node = Node.new(new_node_value)
        new_node.next_node = existing_node.next_node
        existing_node.next_node = new_node
        new_node.prev_node = existing_node
      end
    end

    def delete(value)
      deleted_node = find(value)
      before_deleted_node = deleted_node.prev_node
      after_deleted_node = deleted_node.next_node
      after_deleted_node.prev_node = before_deleted_node

    end



end



list = DoublyLinkedList.new("I")
list.append("Love")
list.append("Momo")
list.prepend("Hello")
p list.to_s

# p list.find("I")

list.insert_after("I", "Really")
p list.to_s

list.delete("Hello")
p list.to_s


# first = Node.new(37)
# first.next_node = Node.new(50)
# first.next_node.next_node = Node.new(99)
# first.next_node.next_node.next_node = Node.new(3)

# p Node.to_s
# "37 > 50 > 99 > 3"

# "-8 > 37 > 50 > 99"
