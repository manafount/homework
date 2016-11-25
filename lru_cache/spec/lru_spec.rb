require 'lru_cache'

describe LRUCache do
  subject(:lru_cache) { LRUCache.new(4) }

  describe '#initialize' do
    it "creates an object of type LRUCache" do
      expect(lru_cache.class).to eq(LRUCache)
    end

    it "starts out empty" do
      expect(lru_cache.count).to eq(0)
    end
  end

  describe '#count' do
    it "shows the number of elements in the cache" do
      lru_cache.add("element 1")
      lru_cache.add(2)

      expect(lru_cache.count).to eq(2)
    end

    it "is limited to the maximum size of the cache object" do
      6.times do |i|
        lru_cache.add("element #{i}")
      end

      expect(lru_cache.count).to eq(4)
    end
  end

  describe '#add' do
    it "adds an element to the cache" do
      lru_cache.add(5)

      expect(lru_cache.count).to eq(1)
    end

    it "removes the least recently used elements after getting to max size" do
      5.times do |i|
        lru_cache.add(i)
      end

      expect(lru_cache.include?(0)).to be_falsey
    end
  end
end
