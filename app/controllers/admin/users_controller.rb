class Admin::UsersController < Admin::BaseController
  before_action :load_user, only: :destroy

  def index
    @users = User.search_by(params[:search]).paginate page: params[:page],
      per_page: Settings.admin_users_controller.per_page
    @quantity_users = @users.count
    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = t "delete_success"
    else
      flash[:danger] = t "delete_fail"
    end
    respond_to do |format|
      format.html {redirect_to admin_users_url, status: 303}
      format.js
    end
  end

  private
  def load_user
    @user = User.find_by id: params[:id]
    unless @user
      flash[:danger] = t "do_not_find_user"
      redirect_to :back
    end
  end
end
