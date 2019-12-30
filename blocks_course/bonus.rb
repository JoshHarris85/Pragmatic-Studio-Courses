def progress
  0.step(100, 10) { |n| yield(n) }
end

progress { |percent| puts percent }

def greet
  yield
end

greet { |name, age| puts "Hello, #{name}. You don't look #{age}!" }

class Integer
  def n_times
    i = 0
    while i < self
      yield i
      i += 1
    end
  end
end

10.n_times { |n| puts n }

class Array
  def my_each
    i = 0
    while i < size
      yield self[i]
      i += 1
    end
    self
  end
end

arr = %w[test foo fi fo fum]
puts arr.my_each { |x| puts x }.map(&:upcase)
