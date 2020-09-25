class PostsController < ApplicationController

    def index
        @posts = Post.all
    end

    def show
        current_post
    end

    def new
        @post = Post.new
        @destinations = Destination.all
        @bloggers = Blogger.all
    end

    def create
        new_post = Post.create(post_params)
        redirect_to post_path(new_post)
    end

    def edit
        current_post
        @destinations = Destination.all
        @bloggers = Blogger.all
    end

    def update
        current_post.update(post_params)
        redirect_to post_path(current_post)
    end

    def destroy
        current_post
        current_post.destroy
        redirect_to posts_path
    end

    def current_post
        @post = Post.find(params[:id])
    end

    def post_params
        params.require(:post).permit(:title, :content, :blogger_id, :destination_id)
    end
end
