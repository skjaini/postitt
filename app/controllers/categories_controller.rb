class CategoriesController < ApplicationController
	def new
		@category = Category.new
	end

	def create
		@category = Category.new(params.require(:category).permit(:name))
		if @category.save
			redirect_to posts_path, notice: "Category was created!"
		else
			render :new 
		end
	end

	def show
		@category = Category.find(params[:id])
	end

  	def edit
    	@category = Category.find(params[:id])
  	end
  
  	def update
    	@category = Category.find(params[:id])
    	if @category.update(post_params)
      		redirect_to post_path(@category), notice: "Category was updated!"
    	else
      		render :edit
    	end
  	end

  	def destroy
  	end

  	private 

	def post_params
    	params.require(:category).permit(:name)
  	end
end