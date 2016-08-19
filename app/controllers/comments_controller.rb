class CommentsController < ApplicationController
  before_action :get_book

  def edit
  end

  def create
    @comment = @book.comments.new(comment_params)
    @comment.member_id = current_member.id
    if @comment.save
      redirect_to @book, notice: 'Comment was created.'
    else
      redirect_to @book
    end
  end

  def destroy
    
  end

  private

    def get_book
      @book = Book.find(params[:book_id])
    end

    def comment_params
      params.require(:comment).permit(:body)
    end

    def authorize_member!
      redirect_to rooth_path, notice: 'Do not touch comment who anotherone' unless @cooment.member_id == current_member.id
    end
end
