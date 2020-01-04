def with_debugging
  puts "Got Here!"
  result = yield
  puts "Result was #{result}"
end

with_debugging do
  magic_number = (23 - Time.now.hour) * Math::PI
end

def with_expectation(expected_value)
  puts 'Running Test...'
  result = yield

  if result == expected_value
    puts 'Passed.'
  else
    puts 'Failed!'
    puts "Expected #{expected_value}, but got #{result}."
  end
end

with_expectation(4) { 2 + 2 }

with_expectation(5) { 2 + 2 }

def time_it(name)
  require 'benchmark'

  elapsed_time = Benchmark.realtime do
    yield
  end

  puts "#{name} took #{elapsed_time}"
end

time_it("Sleepy code") do
  # run some code
  sleep(1)
end
