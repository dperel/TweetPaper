class ArticlesController < ApplicationController

  def new
    @article = Article.new
  end

  def create
    Article.populate(article_params, current_user)
    @articles = Article.where(user_id = current_user.id)
    @article = Article.last
    respond_to do |format|
    if @article.save
      format.js {}
      format.json {render json: @article}
    else
      render :index
    end
  end
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
    params.permit(:title)
  end


end
