class Book < ApplicationRecord
	has_many  :votes
	belongs_to :author
	belongs_to :admin
	has_many :comments
end
