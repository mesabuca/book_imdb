class VotesController < ApplicationController
  	before_action :authenticate_member!
	before_action :set_book
	before_action :set_vote, only: [:update]
	before_action :authorize_member!, only: [:update]

	def create
	  @vote = @book.votes.new
	  @vote.rating = params[:vote][:rating]
	  @vote.member = current_member
	  if @vote.save
	     redirect_to @book, notice: "Vote was saved."
	  else
	     redirect_to @book, notice: "Vote is not valid."
	  end
	end

	def update
	  if @vote.update(rating: params[:vote][:rating])
	    redirect_to @book, notice: "Vote was saved."
	  else
	    redirect_to @book, notice: "Vote is not valid."
	  end
	end

	 private

	 def authorize_member!
	   redirect_to @book, notice: "Not authorized" unless @vote.member_id == current_member.id
	 end

	 def set_vote
	   @vote = Vote.find(params[:id])
	 end

	 def set_book
	   @book = book.find(params[:book_id])
	end
end
