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

    def size
        explorer = @head
        counter = 1
        until explorer.nil? do
            explorer = explorer.next_node
            counter += 1
        end
        counter -= 1
    end

    def at(index)
        explorer = @head
        counter = 1
        until counter == index do
            explorer = explorer.next_node
            counter += 1
        end
        explorer
    end

    def pop
        explorer = @head
        counter = 1
        size = self.size - 1
        until counter == size do
            explorer = explorer.next_node
            counter += 1
        end
        explorer.next_node = nil
        @tail = explorer
    end

    def shift
        @head = @head.next_node
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
        counter = 1
        until explorer.nil?  do
            return counter if explorer.value == value
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
    end

    def insert_at(value, index)
        size = self.size
        return self.prepend(value) if index < 2
        return self.append(value) if index > size
        before = nil
        after = nil
        node = Node.new(value)
        explorer = @head
        counter = 1
        until counter > index do
            before = explorer if counter == index - 1
            after = explorer if counter == index
            explorer = explorer.next_node
            counter += 1
        end
        before.next_node = node
        node.next_node = after
    end

    def remove_at(index)
        size = self.size
        return self.shift if index < 2
        return self.pop if index > size
        before = nil
        target = nil
        explorer = @head
        counter = 1
        until counter > index do
            before = explorer if counter == index - 1
            target = explorer if counter == index
            explorer = explorer.next_node
            counter += 1
        end
        before.next_node = target.next_node
        target.next_node = nil
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
list.to_s
list.append(5)
list.to_s
list.append(43)
list.to_s
puts "The list has #{list.size} elements."
list.prepend(21)
list.to_s
puts "The list has #{list.size} elements."
puts "The node in position 4 is #{list.at(4)}."
list.pop
list.to_s
puts "The list has #{list.size} elements."
puts "Does the list contain the value 1? #{list.contains?(1)}"
puts "Does the list contain the value 5? #{list.contains?(5)}"
puts "The value 32 is in position #{list.find(32)}."
list.insert_at(11, 3)
list.to_s
list.insert_at(0, 7)
list.to_s
list.shift
list.to_s
list.remove_at(4)
list.to_s