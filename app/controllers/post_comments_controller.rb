class PostCommentsController < ApplicationController

before_action :find_post, :only=>[:update, :destroy, :create]

  def create
    @comment=Comment.new(comment_params)
    if @comment.save
      flash[:notice]="Create Succeeded"
      redirect_to post_path(@post)
    else
      @comments=Comment.all
      render :action=>:show
    end
  end

  def update
    if @comment.update(comment_params)
      flash[:notice]="Update Succeeded"
      redirect_to post_path(@post)
    else
      render :action=>:show
    end
  end

  def destroy
    @comment.destroy
    flash[:alert] = "Delete Succeeded"
    redirect_to post_path(@post)
  end


  protected

  def find_post
    @post=Post.find(params[:id])
  end

  def comment_params
      params.require(:comment).permit(:speech, :post_id)
  end

end
