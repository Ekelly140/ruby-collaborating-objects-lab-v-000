class Song 
  attr_accessor :name, :artist, :artist_name
  def initialize(name)
    @name = name 
  end 
  
  def artist_name=(name)
  self.artist= Artist.find_or_create_by_name(name)
  self.artist.add_song(self)
  self.artist.save
  
  end 
  
  def self.new_by_filename(file)
    title = file.split(" - ")[1]
    song = self.new(title)
    song.artist_name= file.split(" - ")[0]
    song
  end 
end 