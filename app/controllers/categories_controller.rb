class CategoriesController < ApplicationController
  before_filter :logged_in_user
  def index
    @categories = Category.all.order_by_date.paginate(page: params[:page])
      .per_page Settings.categories_controller.per_page
  end
end
