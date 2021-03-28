class UsersController < ApplicationController
    before_action :authenticate_user!
    def new
        @user = User.new
    end
    def index
        @user = current_user   
    end

    def feed
        @post = Post.all
    end
end
