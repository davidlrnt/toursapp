class Search
  attr_accessor :city, :category, :tags

  def initialize(hash = {"city" => "", "category" => "", "tags" => ""})
    @city = hash["city"]
    @category = hash["category"]
    @tags = hash["tags"]
  end


  def get_tours
    category = Category.find_by(name: @category)
    @tours = Tour.where(category: category)
    @results = []
    @tours.each do |tour|
      tour.cities.each do |city|
        if @city.downcase == city.name
          @results << tour
        end
      end
    end
    @moreresults =[]
    @results.each do |tour|
      tour.tags.each do |tag|
        if @tags == tag.name
          @moreresults << tour
        end
      end
    end
    @moreresults.empty? ? @results : @moreresults
  end

end
