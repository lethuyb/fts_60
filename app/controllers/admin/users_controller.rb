class Admin::UsersController < ApplicationController
  layout "admin"
  before_action :check_if_admin
  load_and_authorize_resource

  def index
    @users =  User.order(created_at: :desc).page(params[:page])
     .per Settings.per_page
     attributes = %w(id name email current_sign_in_at last_sign_in_at)
     respond_to do |format|
      format.html
      format.csv { render text: @users.to_csv(attributes) }
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = t "page.admin.users.success"
    else
      flash[:danger] = t "page.admin.users.default"
    end
    redirect_to admin_users_path
  end
end
