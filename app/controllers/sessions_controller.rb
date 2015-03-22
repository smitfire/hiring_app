class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save

      redirect_to users_path
    else
      render :new
    end
  rescue ActiveRecord::RecordNotUnique
    @user.errors.add(:email, "There is already a user with this email")

    render :new
  end

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
      format.js   { render js: "window.louserion.href='#{users_path}'" }
    end
  end

  private

    def user_params
      params.require(:user).permit(:first, :last, :email, :password)
    end

end
