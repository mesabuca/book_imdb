class AuthorsController < ApplicationController
	before_action :set_author,only: [:show,:edit,:update,:destroy]
	 
  def index
  	@authors=Author.all
  end

  def new
  	@author=Author.new
  end

  def show
  	
  end

  def create
  	@author = Author.new(author_params)

  	if @author.save
  	  flash[:success] = 'Islem basariyla tamamlandi'
  	  redirect_to author_path(@author)
  	else
  	  
  	  render :new
  	end
  end

  def update
  	
  	if @author.update(author_params)
      redirect_to author_path(@author)
    else
      
      render :edit
    end  	
  end

  def destroy
  	@author.destroy
    redirect_to authors_path, notice: "Author was deleted"
  end

  def edit
  end

  def author_params
  	params.require(:author).permit(:first_name, :last_name, :biography)
  end

  def set_author
      @author = Author.find(params[:id])
  end
  def get_book
    @author = Author.find(params[:id])
   
  end
end
