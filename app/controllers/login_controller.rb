class LoginController < ApplicationController
  def create
    user = User.where(email: params[:email]).first

    # Session engaged
    if user && user.authenticate(params[:password])
      flash[:success] = "Login sucessful! Welcome #{user.name}!"

      session[:current_user_id] = user.id
    else
      flash[:error] = "Login was not sucessful"
    end

    redirect_to users_path
  end

  def destroy
    session[:current_user_id] = nil

    respond_to do |format|
      format.html { redirect_to users_path }
      format.js   { render js: "window.location.href='#{users_path}'" }
    end
  end
end