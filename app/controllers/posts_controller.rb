class PostsController < ApplicationController

  before_filter :require_login

  def create
  end
  
  def destroy
  end
  
  # list public post.
  def index
    @post = Post.new
    @posts = Post.where(:user_id => session[:user_id])
  end
  
end
