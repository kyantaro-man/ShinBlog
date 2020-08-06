class BlogsController < ApplicationController

  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to blogs_path, notice: 'ブログを投稿しました'
    else
      render :index
    end
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.update(blog_params)
      redirect_to @blog, notice: 'ブログを更新しました'
    else
      render :show
    end
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to blogs_path, notice: 'ブログを削除しました'
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :text)
  end
end
