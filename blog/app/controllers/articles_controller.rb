class ArticlesController < ApplicationController
  http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]
  before_action :redirect_not_logged_in, only: [:index, :show, :destroy]
  def show
    @article = Article.find(params[:id])
  end
  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end
  
  def create
    @user = User.find(params[:user_id])
    @article = @user.articles.create(article_params)
    redirect_to user_path(@user)
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to user_article_path(@article.user, @article)
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to user_path(@article.user)
  end
  private

  def article_params
    params.require(:article).permit(:title, :text)
  end
end
