class CommentsController < ApplicationController
    before_action :require_user
    
    def create
      @game = Game.find(params[:game_id])
      @comment = @game.comments.build(comment_params)
      @comment.gamer = current_gamer
      if @comment.save
        flash[:success] = "Comment was created successfully"
        redirect_to game_path(@game)
      else
        flash[:danger] = "Comment was not created"
        redirect_to :back
      end
    end
    
    private
    
    def comment_params
      params.require(:comment).permit(:description)
    end
    
  end