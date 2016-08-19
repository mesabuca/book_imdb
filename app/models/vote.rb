class Vote < ApplicationRecord
	belongs_to :book
	belongs_to :member

   validates :point, inclusion: (1..5)
   validates :member_id, uniqueness: {scope: :book_id}
end
