class CommentsController < ApplicationController
  before_action :authenticate_member!
  before_action :get_book
  before_action :get_comment, only: [:destroy]
  before_action :authorize_member!, only: [:destroy]

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
    
    @comment.destroy
    redirect_to @book, notice: 'Comment was deleted.'
  end

  private

    def get_book
      @book = Book.find(params[:book_id])
    end

    def comment_params
      params.require(:comment).permit(:body)
    end

    def authorize_member!
      redirect_to root_path, notice: 'Do not touch comment who anotherone' unless @comment.member_id == current_member.id
    end

    def get_comment
      @comment = Comment.find(params[:id])
    end
end
