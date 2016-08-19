class Book < ApplicationRecord
	belongs_to :category
	has_many  :votes
	belongs_to :author
	belongs_to :admin
	has_many :comments

	def average_point
     votes.average(:point).to_s
    end
end
