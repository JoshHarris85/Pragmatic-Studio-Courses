def three_times
  1.upto(3) do |n|
    yield(n)
  end
end

three_times do |number|
  puts "#{number} situp"
  puts "#{number} pushup"
  puts "#{number} chinup"
end

def n_times(number)
  1.upto(number) do |n|
    yield(n)
  end
end

n_times(5) do |n|
  puts "#{n} situps"
  puts "#{n} pushups"
  puts "#{n} chinups"
end
