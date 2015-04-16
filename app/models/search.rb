class Search
  attr_accessor :city, :category, :tags

  def initialize(hash)
    @city = hash["city"]
    @category = hash["category"]
    @tags = hash["tags"]
  end

end
