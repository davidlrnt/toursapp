class Search
  attr_accessor :city, :category, :tags

  def initialize(hash = {"city" => "", "category" => "", "tags" => ""})
    @city = hash["city"]
    @category = hash["category"]
    @tags = hash["tags"]
  end


  def get_tours
    category = Category.find_by(name: @category)
    if category.nil? && @tags.empty?
      @results = Tour.joins(:cities).where(cities: {name: @city.downcase})
    elsif category.nil?
      @results = Tour.joins(:tags).where(tags: {name: @tags.downcase})
    else
      if !@tags.empty?
      found_tours = []
      found_tours <<  Tour.joins(:cities).joins(:tags).where(cities: {name: @city.downcase}).where(category: category, published: true).where(tags: {name: @tags.downcase})
      found_tours <<  Tour.joins(:cities).where(cities: {name: @city.downcase}).where(category: category, published: true).where("title LIKE :word1", {:word1 => "%#{@tags}%"})
      found_tours.flatten.uniq
      else
      resultscity = Tour.joins(:cities).where(cities: {name: @city.downcase}).where(category: category, published: true)
      end
    end
  end

end
