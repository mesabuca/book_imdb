class BooksController < ApplicationController
  before_action :authenticate_admin!, except: [:index, :show, :top_books]
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :get_book, only: [:destroy]
  before_action :authorize_admin!, only: [:edit, :update, :destroy]

  def index
    @books = Book.all
  end

  def top_books
    @top_books = Book.top_books
  end
  
  def show
    if current_member
      if @book.votes.where(member_id: current_member.id).any?
        @vote = @book.votes.where(member_id: current_member.id).first
      else
        @vote = @book.votes.build
      end
    end
  end

  def new
    @book = Book.new
    set_categories
  end

  def edit
    set_categories
  end

  def create
    set_categories
    @book = Book.new(book_params)
    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_book
      @book = Book.find(params[:id])
    end

    def book_params
      params.require(:book).permit(:name, :publisher, :category_id, :author_id, :avatar)
    end

    def set_categories
      @categories = Category.all.collect {|c| [c.kind, c.id ] }
      @authors = Author.all.collect {|a| [[a.first_name, a.last_name].join(" "), a.id ] }
    end

    def authorize_admin!
      redirect_to books_path, notice: 'do not touch book' unless current_admin.present?
    end

    def get_book
      @book = Book.find(params[:id])
    end

end
