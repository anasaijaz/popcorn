class PostsController < ApplicationController
    def new 
        @post = Post.new
    end
    
    def show
        @post = Post.find(params[:id])
    end
    
    def create
        @p = Post.new(title:params[:title] , post:params[:post] , user_id:current_user.id)
        if @p.save 
            redirect_to root_path
        else
            render root_path
        end
        
    end

    def like
        @post = Post.all.find(params[:id])
        Like.create(user_id:current_user.id , post_id:@post.id)
        redirect_to root_path
    end

    def comment
        @comment = Comment.new(comment:lund_params[:comment] , post_id:lund_params[:id] , user_id:current_user.id)
        if @comment.save 
            redirect_to root_path
        else
            render root_path
        end
    end

    private 
    def lund_params
        params.permit(:comment , :id)
    end
end
