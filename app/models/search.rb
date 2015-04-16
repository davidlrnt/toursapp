class Search
  attr_accessor :city, :category, :tags

  def initialize(hash = {"city" => "", "category" => "", "tags" => ""})
    @city = hash["city"]
    @category = hash["category"]
    @tags = hash["tags"]
  end


  def get_tours
    binding.pry
    ["Tour1","Tour2","Tour3"]
  end
end
