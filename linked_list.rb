class Node
  attr_accessor :value, :next_node
  def initialize(value)
    @value = value
  end
end

class LinkedList
  def initialize(value)
    node = Node.new(value)
    @head = node
    @tail = node
  end

  def append(value)
    @tail.next_node = Node.new(value)
    @tail = @tail.next_node
  end

  def prepend(value)
    new_node = Node.new(value)
    new_node.next_node = @head
    @head = new_node
  end

  #recursion
  def to_s(current_node=@head) # (something = something) is how you set up a default value
    return current_node.value if current_node.next_node.nil?
    return "#{current_node.value} > #{to_s(current_node.next_node)}"
  end

  def find(value,current_node=@head) #find returns the code
    return current_node if current_node.value == value
    return nil if current_node.next_node.nil?
    find(value, current_node.next_node)
  end

  def find_before(value,current_node=@head)
    return nil if @head.value == value
    return current_node if current_node.next_node.value == value
    find_before(value, current_node.next_node)
  end

  def insert_after(before_value, new_value)
    if @tail.value == before_value
      append(new_value)
    else
      before_node = find(before_value)
      swap = before_node.next_node
      new_node = Node.new(new_value)
      before_node.next_node = new_node
      new_node.next_node = swap
    end
  end

  def delete(value)
    before_node = find_before(value)
    if before_node.nil?
      swap = @head.next_node
      @head.next_node = nil
      @head = swap
    else
      before_node.next_node = before_node.next_node.next_node
    end
  end

  # def reverse
  #
  #   swap = @head
  #
  #   @head.value = @tail.value
  #   @head.value
  #   @tail = swap
  #   puts @tail.value
  # end


end

# numbers = LinkedList.new(37)   #37
# numbers.append(50)             #37 50
# numbers.append(99)             #37 99 (bad, if using only @head.next_node = Node.new(value) in append )
# p numbers.to_s
# numbers.prepend(-8)
# p numbers.to_s
# # "-8 > 37 > 50 > 99"
#
# p numbers.find(99)
# #<Node:0x007fc2ca207a30 @value=99>

list = LinkedList.new("I")   #37
list.append("Love")             #37 50
list.append("Momo")             #37 99 (bad, if using only @head.next_node = Node.new(value) in append )
p list.to_s
list.prepend("Hello")
p list.to_s
# "-8 > 37 > 50 > 99"

p list.find("Momo")
list.insert_after("I", "Really")
p list.to_s
# "Hello > I > Really > Love > Momo"
list.insert_after("Momo", "Choi")
p list.to_s
# "Hello > I > Really > Love > Momo > Choi"

p list.find_before("Momo")
list.delete("Really")
p list.to_s
#

# list.delete("Hello")
# p list.to_s
# # p list.find_before("Momo")
#
# list.delete("Momo")
# p list.to_s

# p list.reverse
