class Admin::PostsController < ApplicationController	
	before_action :logged_in?
	before_action :set_post, only: %i[show edit update destroy]
	
	def index
		@posts = Post.all.page(params[:page]).per(10)		
	end

	def show
		#@post = Post.find(params[:id])
		#@image = Image.where(post_id: params[:id])
		@images = @post.images
		@address = @post.address		
	end
	def new
		@post = Post.new		
	end
	def create
		
	end

	def edit
	end
	
	def update
   if @post.update_attributes(post_params)
      redirect_to admin_post_path
   else      
      render :action => 'edit'
   end
	end

	def destroy
   
    #@post.destroy
    #redirect_to '/admin/posts', :notice => "Your poster has been deleted"
	end

	private   
		def set_post
			@post = Post.find(params[:id])
		end		
    def post_params
      params.require(:post).permit(
        :title,
        :price,
        :area,
        :quantity,
        address_attributes: [:city, :district, :add_detail],
        images_attributes: [:image]
      )
    end
end
