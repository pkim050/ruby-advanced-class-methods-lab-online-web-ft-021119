require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create
    song = self.new
    @song = song
    self.all << song
    @song
  end
  
  def self.new_by_name(name)
    song_name = self.new
    song_name.name = name
    song_name
  end
  
  def self.create_by_name(name)
    song_name = self.new
    song_name.name = name
    @@all << song_name
    song_name
  end
  
  def self.find_by_name(name)
    self.all.find {|item| item.name == name}
  end
  
  def self.find_or_create_by_name(name)
    return self.create_by_name(name) if self.find_by_name(name) == nil
    return self.find_by_name(name)
  end
  
  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end
  
  def self.new_from_filename(filename)
    song_name = self.new
    arr = filename.split(/ - /)
    song_name.name = arr[1][0..-5]
    song_name.artist_name = arr[0]
    song_name
  end
  
  def self.create_from_filename(filename)
    self.all << self.new_from_filename(filename)
  end
  
  def self.destroy_all
    self.all.clear
  end
end
