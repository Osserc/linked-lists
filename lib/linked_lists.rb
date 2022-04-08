class LinkedList
    attr_reader :head, :tail
    # include SiFo
    def initialize(head = nil, tail = nil)
        @head = Node.new(head)
        @tail = Node.new(tail)
        @head.next_node = @tail
    end

    def append(value)
        node = Node.new(value)
        if @tail.nil?
            @tail = node
        else
            @tail.next_node = node
            @tail = node
        end
    end

    def prepend(value)
        node = Node.new(value)
        if @head.nil?
            @head = node
            @head.next_node = @tail if @tail.nil? == false
        else
            node.next_node = @head
            @head = node
        end
    end

    def update_position(first_node, second_node)
        temp = second_node.next_node
        first_node.next_node = second_node.next_node
        temp
    end

    def size
        explorer = @head
        counter = 0
        until explorer.nil? do
            explorer = explorer.next_node
            counter += 1
        end
        counter
    end

    def at(index)
        explorer = @head
        counter = 0
        until counter == index - 1 do
            explorer = explorer.next_node
            counter += 1
        end
        explorer.value
    end

    def pop
        explorer = @head
        counter = 0
        size = self.size - 2
        until counter == size do
            explorer = explorer.next_node
            counter += 1
        end
        explorer.next_node = nil
        @tail = explorer
    end

    def contains?(value)
        explorer = @head
        until explorer.nil? do
        return true if explorer.value == value
        explorer = explorer.next_node 
        end
        return false
    end

    def find(value)
        explorer = @head
        counter = 0
        until explorer.nil?  do
            return counter += 1 if explorer.value == value
            explorer = explorer.next_node
            counter += 1
        end
    end

    def to_s
        string = ""
        explorer = @head

        until explorer.nil? do
            string += "( #{explorer.value} ) --> " if explorer.value.nil? == false
            explorer = explorer.next_node
        end
        puts string += "nil"


    # to_s represent your LinkedList objects as strings, so you can print them out and preview them in the console.
    # The format should be: ( value ) -> ( value ) -> ( value ) -> nil
    end

end

class Node
    attr_accessor :value, :next_node
    def initialize(value = nil, next_node = nil)
        @value = value
        @next_node = next_node
    end
end


list = LinkedList.new(10, 32)
list.append(5)
list.append(43)
puts list.size
list.prepend(21)
puts list.size
puts list.at(4)
list.pop
puts list.size
puts list.contains?(1)
puts list.contains?(5)
puts list.find(32)
list.to_s
puts "Stop"