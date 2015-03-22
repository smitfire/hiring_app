class RegistrationsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:current_user_id] = @user.id
      redirect_to @user, notice: 'User was successfully created.'
    else
      render :new
    end
  rescue ActiveRecord::RecordNotUnique
    @user.errors.add(:email, "There is already a user with this email")

    render :new
  end

  private

    def user_params
      params.require(:user).permit(:first, :last, :email, :password, :password_confirmation)
    end
end