class Book < ApplicationRecord
	belongs_to :category
	has_many  :votes
	belongs_to :author
	has_many :comments
end
