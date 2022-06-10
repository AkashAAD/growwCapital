module PersonalAdmin
  class ProductController < ApplicationController
    before_action :get_product, only: [:edit, :show, :destroy, :update]
    before_action :check_accountant
    before_action :authenticate_user!
    layout 'personal_admin'

    def index
      @products = Product.all
      @products = search_products(params[:search]) if params[:search].present?
      @products = @products.order(id: :desc).paginate(page: params[:page], per_page: 10)
    end

    def new
      @product = Product.new
    end

    def create
      @product = Product.new(set_params)

      if @product.save
        flash[:notice] = 'New product created successfully.'
        redirect_to sales_manager_products_path
      else
        flash[:error] = @product.errors.full_messages.join(', ')
        render :new
      end
    end

    def update
      if @product.update(set_params)
        flash[:notice] = 'product updated successfully.'
        redirect_to sales_manager_products_path
      else
        flash[:error] = @product.errors.full_messages.join(', ')
        render :edit
      end
    end

    def edit; end

    def show; end

    def destroy
      @product.destroy
      flash[:notice] = 'product deleted successfully.'
      redirect_to sales_manager_products_path
    end

    private

    def set_params
      params.require(:product).permit(:name)
    end

    def get_product
      @product = Product.find_by!(id: params[:id])
    end

    def search_products(search)
      key = "%#{search}%"
      columns = Product.column_names
      return Product.where(
        columns.map { |c| "#{c} like :search" }.join(' OR '),
        search: key
      )
    end
  end
end

