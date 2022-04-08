# module SiFo
#     sizing = Proc.new { | exploration | exploration.nil? }
# end

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
        counter = exploring(&sizing)[0]
        puts "The list contains #{counter} nodes."
    end

    def at(index)
        node = exploring(index, &finding)[1]
        puts node.value
    end

    def exploring(index = 0)
        exploration = @head
        counter = 0
        until yield(exploration, counter, index) do
            exploration = exploration.next_node
            counter += 1
        end
        return counter, exploration
    end

    def sizing
        Proc.new { | exploration | exploration.nil? }
    end

    def finding
        Proc.new { | exploration, counter, index | counter == index - 1}
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
list.size
list.prepend(21)
list.size
list.at(4)
puts "Stop"