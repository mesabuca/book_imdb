class Book < ApplicationRecord
	has_many  :votes
	belongs_to :author
end
