class TagTour < ActiveRecord::Base
  belongs_to :tag
  belongs_to :tour
end
