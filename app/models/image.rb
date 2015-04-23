class Image < ActiveRecord::Base
    belongs_to :location
    belongs_to :tour
    belongs_to :user
    belongs_to :comment
    belongs_to :review
    belongs_to :city
end
