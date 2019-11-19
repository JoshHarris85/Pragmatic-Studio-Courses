def say_hello(name, health=100)
  return "I'm #{name.capitalize} with a health of #{health} as of #{time}."
end

def time
  Time.now.strftime("%I:%M:%S")
end

puts say_hello("larry", 60)
puts say_hello("curly", 125)
puts say_hello("moe")
puts say_hello("shemp", 90)
