class PostsController < ApplicationController

  before_filter :require_login, :except => [:index]

  def create
  end
  
  def destroy
  end
  
  # list public post.
  def index
    puts "public"
  end
  
  def new
    @Post = Post.new
  end
  
end
