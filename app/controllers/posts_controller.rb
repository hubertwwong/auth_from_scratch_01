class PostsController < ApplicationController

  before_filter :require_login

  def create
    @post = Post.new(params[:post])
    @post.user_id = session[:user_id]

    respond_to do |format|
      if @post.save
        format.html { redirect_to action: "index", notice: 'Post was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end
  
  def destroy
  end
  
  # list public post.
  def index
    puts "session"
    puts session.inspect
    @posts = Post.where(:user_id => session[:user_id])
  end
  
  def new
    @post = Post.new
  end
  r
end
