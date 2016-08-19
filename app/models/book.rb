class Book < ApplicationRecord
	belongs_to :category
	has_many  :votes
	belongs_to :author
	has_many :comments

	def average_point
     point = votes.average(:point)
     point ? point.to_s : "0.0"
    end

	def self.top_books	
     self.joins(:votes)
      .select("books.*, avg(votes.point) as puan")
      .group("books.id")
      .order("puan DESC")
      .limit(10)
  end

end
