class Admin::PostsController < ApplicationController	
	def index
		@posts = Post.all.page(params[:page]).per(10)		
	end

	def show
		@post = Post.find(params[:id])
		@image = Image.where(post_id: params[:id])
		@address = Address.find_by(post_id: params[:id])
		#@books = Book.where(author_id: @author.id)
	end

end
