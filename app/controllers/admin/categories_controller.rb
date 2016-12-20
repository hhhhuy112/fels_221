class Admin::CategoriesController < Admin::BaseController
  before_action :load_category, except: [:index, :new, :create]

  def index
    @categories = Category.search_by_name(
      params[:search]).order_by_date.paginate page: params[:page],
      per_page: Settings.admin_categories_controller.per_page
    @quantity = @categories.count
    @category = Category.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @questions = Question.search_by_content(params[:search]).search_by_category(
      @category.id).order_by_date.paginate page: params[:page],
      per_page: Settings.admin_categories_controller.per_page
    @quantity = @questions.count
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = t "add_success"
      redirect_to admin_categories_url
    else
      render :index
    end
  end

  def edit
  end

  def update
    if @category.update_attributes category_params
      flash[:success] = t "update_success"
    else
      flash[:danger] = t "update_fail"
    end
    redirect_to [:admin, @category]
  end

  def  destroy
    if @category.destroy
      flash[:success] = t "delete_success"
    else
      flash[:danger] = t "delete_fail"
    end
    respond_to do |format|
      format.html {redirect_to admin_categories_url}
    end
  end

  private
  def load_category
    @category = Category.find_by id: params[:id]
    unless @category
      flash[:danger] = t "do_not_find_item"
      redirect_to :back
    end
  end

  def category_params
    params.require(:category).permit :id, :name
  end
end
