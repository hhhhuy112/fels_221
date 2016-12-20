class Admin::QuestionsController < Admin::BaseController
  before_action :load_question, only: [:show, :edit, :update, :destroy]

  def index
    @questions = Question.filter_by(params[:category_id], params[:search])
      .paginate page: params[:page], per_page: 5
    @categories=Category.all
    @quantity =@questions.count
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @quantity_answers = @question.answers.count
  end

  def new
  end

  def create
    @category = Category.find_by id: params[:question][:category_id]
    @question = Question.new question_params;
    if @question.save
      flash[:success] = t "add_success"
    else
      flash[:danger] = t "add_fail"
    end
    redirect_to [:admin, @category]
  end

  def edit
  end

  def update
    if @question.update question_params
      flash[:success] = t "update_success"
      redirect_to [:admin, @question]
    else
      flash[:danger] = t "update_fail"
      render :show
    end
  end

  def destroy
    @category = @question.category
    if @question.destroy
      flash[:success] = t "delete_success"
    else
      flash[:danger] = t "delete_fail"
    end
    redirect_to [:admin, @category]
  end

  private
  def question_params
    params.require(:question).permit :category_id, :content,
      answers_attributes: [:id, :content, :is_correct, :_destroy]
  end

  def load_question
    @question = Question.find_by id: params[:id]
    unless @question
      flash[:danger] = t "do_not_find_item"
      redirect_to :back
    end
  end
end
