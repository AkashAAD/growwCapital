module PersonalAdmin
  class BlogController < ApplicationController
    before_action :get_blog, only: [:edit, :show, :destroy, :update]
    before_action :check_admin
    before_action :authenticate_user!
    layout 'personal_admin'

    def index
      @blogs = Blog.all
      @blogs = search_blogs(params[:search]) if params[:search].present?
      @blogs = @blogs.order(id: :desc).paginate(page: params[:page], per_page: 10)
    end

    def new
      @blog = Blog.new
    end

    def create
      @blog = Blog.new(set_params)
      @blog.content = params[:blog][:content][0]

      if @blog.save
        flash[:notice] = 'New blog created successfully.'
        redirect_to sales_manager_blogs_path
      else
        flash[:error] = @blog.errors.full_messages.join(', ')
        render :new
      end
    end

    def update
      if @blog.update(set_params)
        @blog.content = params[:blog][:content][0]
        @blog.save

        flash[:notice] = 'blog updated successfully.'
        redirect_to sales_manager_blogs_path
      else
        flash[:error] = @blog.errors.full_messages.join(', ')
        render :edit
      end
    end

    def edit; end

    def show; end

    def destroy
      @blog.destroy
      flash[:notice] = 'blog deleted successfully.'
      redirect_to sales_manager_blogs_path
    end

    private

    def set_params
      params.require(:blog).permit(
        :title,
        :auther_name,
        :keywords,
        :meta_description,
        :publish_date,
        :desktop_image,
        :mobile_image,
        :approved
      )
    end

    def get_blog
      @blog = Blog.find_by!(id: params[:id])
    end

    def search_blogs(search)
      key = "%#{search}%"
      columns = Blog.column_names
      return Blog.where(
        columns.map { |c| "#{c} like :search" }.join(' OR '),
        search: key
      )
    end
  end
end
