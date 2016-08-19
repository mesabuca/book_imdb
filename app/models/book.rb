class Book < ApplicationRecord
	belongs_to :category
	has_many  :votes
	belongs_to :author
	has_many :comments

	def average_point
     point = votes.average(:point)
     point ? point.to_s : "0.0"
    end
    
end
