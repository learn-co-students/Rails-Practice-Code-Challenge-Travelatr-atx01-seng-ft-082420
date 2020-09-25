class DestinationsController < ApplicationController

    def index
        @destinations = Destination.all
    end

    def show
        @destination = Destination.find(params[:id])
        @destination_most = @destination.posts.max_by {|post| post.likes}
    end
    
end
