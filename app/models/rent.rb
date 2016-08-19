class Rent < ApplicationRecord
	belongs_to :book
	belongs_to :member
end
