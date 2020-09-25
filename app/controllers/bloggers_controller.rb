class BloggersController < ApplicationController

    def index
        @bloggers = Blogger.all
    end

    def show
        current_blogger
        # @likes = 0
        # current_blogger.each do | 
    end

    def new
        @blogger = Blogger.new
    end

    def create
        new_blogger = Blogger.create(blogger_params)
        redirect_to bloggers_path
    end

    def destroy
        current_blogger
        current_blogger.destroy
        redirect_to bloggers_path
    end

    def current_blogger
        @blogger = Blogger.find(params[:id])
    end

    def blogger_params
        params.require(:blogger).permit(:name)
    end

end
