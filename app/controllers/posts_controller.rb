class PostsController < ApplicationController

before_action :find_post, :only=>[:destroy, :edit, :update, :show]

  def index
    @posts=Post.all
    @post=Post.new
  end

  def update
    if @post.update(post_params)
      flash[:notice]="Update Succeeded"
      redirect_to posts_path
    else
      render :action=>:edit
    end
  end

  def edit

  end

  def create
    @post=Post.new(post_params)
    if @post.save
      flash[:notice]="Create Succeeded"
      redirect_to posts_path
    else
      @posts=Post.all
      render :action=>:index
    end
  end

  def show
    @comments=@post.comments
    @comment=Comment.new
  end

  def destroy
    @post.destroy
    flash[:alert] = "Delete Succeeded"
    redirect_to posts_path
  end

  protected

  def find_post
    @post=Post.find(params[:id])
  end

  def post_params
      params.require(:post).permit(:topic, :content)
  end

end

