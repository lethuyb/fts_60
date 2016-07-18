class Admin::UsersController < ApplicationController
  ass Admin::SubjectsController < ApplicationController
  layout "admin"
  before_action :check_if_admin
  load_and_authorize_resource
  skip_authorize_resource only: [:index, :create]
  def index
    @users =  User.page(params[:page]).per Settings.per_page
  end

  def destroy
    if @user.destroy
      flash[:success] = "destroy success"
    elsif @product.nil?
      flash[:danger] = "error"
    end
    redirect_to admin_users_path
  end

  private
  def user_params
    params.require(:user).permit :name, :avatar, :email, :password,
      :password_confirmation
  end

end
