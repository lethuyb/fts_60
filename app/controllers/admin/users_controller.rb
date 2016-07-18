class Admin::UsersController < ApplicationController
  Admin::SubjectsController < ApplicationController
  layout "admin"
  before_action :check_if_admin
  load_and_authorize_resource
  skip_authorize_resource only: [:index]

  def index
    @users =  User.page(params[:page]).per Settings.per_page
  end

end
