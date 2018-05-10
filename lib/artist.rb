require 'pry'
class Artist 
  attr_accessor :name, :all, :songs
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end 
  
  def add_song(song) 
    @songs << song
  end 
  
  def save 
    @@all.each {|artist| return false if artist.name == self.name}
    @@all << self
  end 
  
  def self.all 
    @@all
  end 
  
  def self.find_or_create_by_name(name)
    @@all.each {|n| return n if n.name == name}
    Artist.new(name)
  end 
  
  def print_songs 
    @songs.each {|s| puts s.name}
  end 
end 