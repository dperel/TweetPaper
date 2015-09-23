class ArticlesController < ApplicationController

  def new
    @article = Article.new
  end

  def create
    @article = Article.populate(article_params, current_user)
    if @article
      @articles = Article.all
      render :index
    else
      render js: "alert('Article search did not go through');"
    end
  end

  def index
    @articles = Article.all
  end

  def destroy
    Article.destroy(params[:id])
    redirect_to :back
  end


  private

  def article_params
    params.require(:article).permit(:title)
  end


end
