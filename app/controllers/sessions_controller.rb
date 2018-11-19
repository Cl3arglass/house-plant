class SessionsController < ApplicationController
  def new
  end

  def create
  	if auth_hash = request.env["omniauth.auth"]
      oauth_email = request.env["omniauth.auth"]["info"]["email"]
      if @user = User.find_by(:email => oauth_email)
      	session[:user_id] = @user.id
      	redirect_to user_path(@user) 
      else
      	@user = User.new(:email => oauth_email, :name => request.env["omniauth.auth"]["info"]["name"], :password => SecureRandom.hex)
      	if @user.save
      	  session[:user_id] = @user.id
	      redirect_to user_path(@user) 
	    else
	      flash[:notice] = "Try Again"
	      render 'sessions/new'
	    end
	  end
  	else
	  @user = User.find_by(name: params[:user][:name])
	   if @user && @user.authenticate(params[:password])
	      session[:user_id] = @user.id
	      redirect_to user_path(@user) 
	   else 
	      flash[:notice] = "Try Again"
	      render 'sessions/new'
	   end
	end
  end

  def destroy
  	reset_session
	redirect_to '/'
  end
end
