class Stack
  def initialize
    @contents = []
  end

  def add(el)
    contents.push(el)
  end

  def remove
    contents.pop
  end

  def show
    contents
  end
end

class Queue
  def initialize
    @contents = []
  end

  def enqueue(el)
    contents.push(el)
  end

  def dequeue
    contents.drop(1)
  end

  def show
    contents
  end
end

class Map
  def initialize
    @contents = []
  end

  def assign(key, value)
    if contents.any? { |arr| arr[0] == key }
      index = get_index(key)
      contents[index] = [key, value]
    else
      contents << [key, value]
    end
  end

  def get_index(key)
    contents.find_index { |arr| arr[0] == key }
  end

  def lookup(key)
    index = get_index(key)
    contents[index]
  end

  def remove(key)
    index = get_index(key)
    contents.delete_at(index)
  end

  def show
    contents
  end
end
