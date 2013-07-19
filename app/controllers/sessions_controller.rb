class SessionsController < ApplicationController
  
  def new
  end
  
  def create
    user = User.find_by_email(params[:email])
    #puts "p email > " + params[:email].inspect
    #puts "p > " + params.inspect
    #puts "u >" + user.inspect
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to posts_url, :notice => "Logged in!"
    else
      flash.now[:error] = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
  
end
