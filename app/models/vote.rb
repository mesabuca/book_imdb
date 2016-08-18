class Vote < ApplicationRecord
	belongs_to :book
	belongs_to :member
end
