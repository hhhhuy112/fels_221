class SearchesController < ApplicationController
  before_filter :logged_in_user

  def index
    @categories = Category.all
    search = Search.new keyword: params[:keyword], category: params[:category],
      learn: params[:learn]
    @questions = search.search_words current_user
    if @questions
      @questions = @questions.paginate(page: params[:page])
        .per_page Settings.search_controller.per_page
    else
      @questions = []
    end
    respond_to do |format|
      format.html
      format.js
    end
  end
end
