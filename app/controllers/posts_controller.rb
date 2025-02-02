class PostsController < ApplicationController
  before_action :set_post!, only: [:show, :edit, :update]

  def show
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post.update(post_params)
    if @post.valid?
      redirect_to @post
    else
      flash[:errors] = @post.errors.full_messages
      @post = Post.find(params[:id])
      render 'edit'
    end
  end

  private

  def post_params
    params.permit(:category, :content, :title)
  end

  def set_post!
    @post = Post.find(params[:id])
  end
end
