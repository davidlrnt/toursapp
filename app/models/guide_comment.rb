class GuideComment < ActiveRecord::Base
  belongs_to :guide, class_name: "User"
  belongs_to :comment
end
