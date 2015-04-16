class Search
  attr_accessor :city, :category, :tags

  def initialize(hash = {"city" => "", "category" => "", "tags" => ""})
    @city = hash["city"]
    @category = hash["category"]
    @tags = hash["tags"]
  end


  def get_tours

  end
end
