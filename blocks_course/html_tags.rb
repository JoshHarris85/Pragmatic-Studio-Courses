def h1
  puts "<h1>#{yield}</h1>"
end

h1 { 'Breaking News!' }

def h2
  puts "<h2>#{yield}</h2>"
end

h2 { 'Massive Ruby Discovered' }

def tag(element)
  print "<#{element}>"
  print yield
  print "</#{element}>"
end

tag(:h1) { 'Breaking News!' }
tag(:h2) { 'Massive Ruby Discovered' }

tag(:ul) do
  tag(:li) { 'It sparkles!'}
  tag(:li) { 'It shines!'}
  tag(:li) { 'It mesmerizes!'}
end
