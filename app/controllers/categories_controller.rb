class CategoriesController < ApplicationController
  before_filter :logged_in_user
  def index
    @categories = Category.order_by_date.paginate(page: params[:page])
      .per_page Settings.categories_controller.per_page
    respond_to do |format|
      format.html
      format.js
    end
  end
end
