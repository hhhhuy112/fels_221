class RelationshipsController < ApplicationController
  before_action :logged_in_user
  before_action :load_user_follow, only: :create
  before_action :load_user_unfollow, only: :destroy

  def create
    if current_user.follow @user
      @relationship = current_user.active_relationships.find_by followed_id: @user.id
    else
      flash[:danger] = t "follow_fail"
    end
    respond_to do |format|
      format.html {redirect_to @user}
      format.js
    end
  end

  def destroy
    if current_user.unfollow @user
      @relationship = current_user.active_relationships.build
    else
      flash[:danger] = t "unfollow_fail"
    end
    respond_to do |format|
      format.html {redirect_to @user}
      format.js
    end
  end

  private
  def load_user_follow
    @user = User.find_by id: params[:followed_id]
    unless @user
      flash[:danger] = t "do_not_find_item"
      redirect_to root_url
    end
  end

  def load_user_unfollow
    @relationship = Relationship.find_by id: params[:id]
    if @relationship
      @user = @relationship.followed
    else
      flash[:danger] = t "do_not_find_item"
      redirect_to root_url
    end
  end
end
