class Image < ActiveRecord::Base
    belongs_to :location
    belongs_to :tour
    belongs_to :participant, class_name: "User"
    belongs_to :guide, class_name: "User"
    belongs_to :comment
    belongs_to :review
    belongs_to :city


end
