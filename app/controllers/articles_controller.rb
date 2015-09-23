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
