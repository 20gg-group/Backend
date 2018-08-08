class Admin::PostsController < ApplicationController	
	before_action :block_path
	before_action :set_post, only: %i[show edit update destroy]
	
	def index
		@posts = Post.all.order('created_at DESC').page(params[:page]).per(10)		
	end

	def show
		@images = @post.images
		@address = @post.address		
	end

	def new
		@post = Post.new		
		@post.build_address
		@post.images.new
	end

	def create
		@post = current_user.posts.new(post_params)
		
		if @post.save 
			redirect_to admin_post_path(@post)
    else
      render :new
    end
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
    @post.destroy
		redirect_to admin_posts_path
		flash[:success] = "Your poster has been deleted"
	end

	private   

		def block_path
			unless current_user.present? 
				flash[:error] = "You must be logged in to access this section"
				redirect_to admin_root_path # halts request cycle
			end
		end

		def set_post
			@post = Post.find(params[:id])
		end		
    def post_params
      params.require(:post).permit(
        :title,
        :price,
				:area,
				:phone_contact_number,
				:sex,
				:quantity,
				:description,
				:type_house,
        address_attributes: [:city, :district, :add_detail],
        images_attributes: [:image]
      )
    end
end
