class ArticlesController < ApplicationController

  def new
    @article = Article.new
  end

  def create
    @article = Article.populate(article_params, current_user)
    @articles = Article.where(user_id = current_user.id)
    render :index
  end

  def index
    @articles = Article.where(user_id = current_user.id)
  end

  def refresh
    current_user.articles.map do |article|
      Article.refresh(article, current_user)
    end
    @articles = Article.where(user_id = current_user.id)
    render :index
  end


  def destroy
    Article.destroy(params[:id])
    @articles = Article.where(user_id = current_user.id)
    render :index
  end


  private

  def article_params
    params.require(:article).permit(:title)
  end


end
