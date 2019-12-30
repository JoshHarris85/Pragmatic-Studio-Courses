require_relative 'my_enumerable'

class Song
  attr_reader :name, :artist, :duration

  def initialize(name, artist, duration)
    @name = name
    @artist = artist
    @duration = duration
  end

  def play
    puts "Playing '#{name}' by #{artist} (#{duration} mins)..."
  end

  def each_filename
    formats = %w[.mp3 .wav .aac]

    file_name = "#{name}-#{artist}".gsub(" ", "-").downcase
    formats.each { |format| yield file_name + format}
  end
end

class Playlist
  include MyEnumerable

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    @songs << song
  end

  def each
    @songs.each do |s|
      puts "Yielding #{s.name}..."
      yield s
    end
  end

  def play_songs
    each { |s| s.play }
  end

  def each_by_artist(artist)
    my_select { |s| s.artist == artist }.each { |s| yield s }
  end

  def each_tagline
    each { |s| yield "#{s.name} - #{s.artist}" }
  end
end

song1 = Song.new("Okie From Muskogee", "Merle", 5)
song2 = Song.new("Ramblin' Man", "Hank", 7)
song3 = Song.new("Good Hearted Woman", "Waylon", 6)

playlist = Playlist.new("Country/Western, Y'all!")
playlist.add_song(song1)
playlist.add_song(song2)
playlist.add_song(song3)

playlist.each { |song| song.play }

playlist.play_songs

okie_songs = playlist.my_select { |song| song.name =~ /Okie/ }
p okie_songs

non_okie_songs = playlist.my_reject { |song| song.name =~ /Okie/ }
p non_okie_songs

p playlist.my_any? { |song| song.artist == "Hank" }
p playlist.my_detect { |song| song.artist == "Hank" }

song_labels = playlist.my_map { |song| "#{song.name} - #{song.artist}" }
p song_labels

total_duration = playlist.my_reduce(0) { |sum, song| sum + song.duration }
p total_duration

playlist.each_tagline { |tagline| puts tagline }

playlist.each_by_artist("Hank") { |song| song.play }
playlist.each_by_artist("Waylon") { |song| song.play }

song1.each_filename { |filename| puts filename }
