class RentsController < ApplicationController
  before_action :authenticate_member!
  before_action :get_book
  before_action :get_rent, only: [:destroy]
  before_action :authorize_member!, only: [:update, :destroy]

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

  end
  
  def get_rent
    @rent = Rent.find(params[:id])
  end
 

  def authorize_member!

    redirect_to @book, notice: 'Adam ol o senn kitabın değil' unless @rent.member_id == current_member.id

  end


  def rent_params
    params.require(:rent).permit(:date_of_receipt)
  end
  def get_book
    @book = Book.find(params[:book_id])
  end
  
end
