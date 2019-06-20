class PostsController < ApplicationController

    def index
        @posts = Post.all.order(created_at: 'desc')
    end

    def show
        @post = Post.find(params[:id])
    end

    def new
     @post = current_user.posts.build
    end


    def create
      @post = current_user.posts.build(post_params)

      if @post.save


      redirect_to posts_path
    else
        render 'new'
    end

    end

    private
    def post_params
        params.require(:post).permit(:content, :answer)
    end

    def edit
        @post = Post.find(params[:id])
    end

end
