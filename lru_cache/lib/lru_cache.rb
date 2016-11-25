class LRUCache
  def initialize(n)
    @cache = []
    @max_size = n
  end

  def count
    @cache.size
  end

  def add(el)
    @cache.shift if @cache.size == @max_size
    @cache.push(el)
  end

  def show
    print @cache
  end

  def include?(el)
    @cache.include?(el)
  end
  
private
# helper methods go here!

end
