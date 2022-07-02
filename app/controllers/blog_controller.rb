class BlogController < ApplicationController
  def blogs
    @blogs = Blog.all.where(approved: true).paginate(page: params[:page], per_page: 10)
  end

  def blog
    @blog = Blog.find_by(slug: params[:id])
    @title = @blog.title
    @keywords = @blog.keywords
    @description = @blog.meta_description
  end
end
