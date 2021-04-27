class CommentsController < ApplicationController 
    def index 
        @comments = Comment.all
    end 

    def show 
        @comment = Comment.find(params[:id])
    end 

    def new 
        @comment = Comment.new
    end 
    
    def create 
        if @comment.valid? 
            @comment.save
            redirect_to comment_path(@comment)
        else 
            render :new 
        end 
    end 

    def edit 
        @comment = Comment.find(params[:id])
    end 

    def update 
        if @comment.update(comment_params)
            redirect_to comment_path(@comment)
        else 
            render :edit 
        end 
    end 

    def destroy 
        if @comment.destroy
            redirect_to user_path(current_user)
            flash[:message] = "Your comment was deleted."
        else 
            flash[:message] = "You can't delete other user's comments."
            redirect_to trip_path(@comment)
        end 
    end 

    private 

    def comment_params 
        params.require(:comment).permit(:content)
    end 

end 