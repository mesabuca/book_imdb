class CategoriesController < ApplicationController

	before_action :set_category, except: [:index]	

 	def index
    @categories = Category.all
	end


	 def set_category
    @category = Category.find(params[:id])
	end


end
