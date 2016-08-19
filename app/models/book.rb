class Book < ApplicationRecord
	belongs_to :category
	has_many  :votes
	belongs_to :author
	has_many :comments
	has_many :rents

	def average_point
     point = votes.average(:point)
     point ? point.to_s : "0.0"
    end
    has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png"
  	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
