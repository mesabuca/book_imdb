class RentsController < ApplicationController
  before_action :authenticate_member!
  before_action :get_rent, only: [:destroy,:edit,:show,:update]
  before_action :get_book, except: [:index, :create]
  before_action :get_book_for_rent, except: [:index,:show,:edit,:destroy,:update]
  before_action :authorize_member!, only: [:update, :destroy]

  def index
    @rents= current_member.rents.all
  end
  def create
    @rent = @book.rents.new(rent_params)
    @rent.member_id = current_member.id
    if @rent.save
      redirect_to book_path(@book), notice: 'Kiralandı'
    else
      redirect_to book_path(@book), notice: 'Hatan var pasam'
    end
  end
  def destroy
    @rent.destroy
    redirect_to @book
  end
  def update
    if @rent.update(rent_params)
      redirect_to @rent
    else
      render :edit
    end
  end

  def show
   
  end
  
  def edit

  end
  def authorize_member!

    redirect_to @book, notice: 'Adam ol o senn kitabın değil' unless @rent.member_id == current_member.id

  end
   
  def get_rent
    @rent=Rent.find(params[:id])
  end

  def rent_params
    params.require(:rent).permit(:date_of_receipt)
  end
  def get_book
    @book = @rent.book
    
  end
  def get_book_for_rent
    @book = Book.find(params[:book_id])
  end
end
