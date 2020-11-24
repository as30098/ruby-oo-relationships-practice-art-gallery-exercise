class Artist

  attr_reader :name, :years_experience

  @@all = []

  def initialize(name, years_experience, title, price, gallery)
    @name = name
    @years_experience = years_experience
    @title = title
    @price = price
    @gallery = gallery
    @@all << self
  end

  def self.all
    @@all
  end

  def paintings
    Painting.all.select {|painting| painting.artist == self}
  end

  def galleries
    self.painting.map {|painting| painting.gallery}
  end

  def cities
    self.painting.map {|painting| painting.gallery.city}
  end

  def self.total_experience
    @@all.map {|artist| artist.years_experience}.sum
  end

  def self.most_prolific
    @@all.select.max_by {|artist| artist.painting.count && artist.years_experience}
  end

  def create_painting(title, price, gallery)
    Painting.new(title, price, self, gallery)
  end


end
