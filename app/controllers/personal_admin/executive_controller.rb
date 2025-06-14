module PersonalAdmin
  class ExecutiveController < ApplicationController
    before_action :get_executive, only: [:edit, :show, :destroy, :update]
    before_action :check_accountant
    before_action :authenticate_user!
    layout 'personal_admin'

    def index
      @executives = Executive.all.undeleted
      @executives = search_executives(params[:search]) if params[:search].present?
      @executives = @executives.order(id: :desc).paginate(page: params[:page], per_page: 10)
    end

    def new
      @executive = Executive.new
    end

    def create
      @executive = Executive.new(set_params)
      @executive.user = current_user

      if @executive.save
        flash[:notice] = 'New executive created successfully.'
        redirect_to sales_manager_executives_path
      else
        flash[:error] = @executive.errors.full_messages.join(', ')
        render :new
      end
    end

    def update
      if @executive.update(set_params)
        flash[:notice] = 'Executive updated successfully.'
        redirect_to sales_manager_executives_path
      else
        flash[:error] = @executive.errors.full_messages.join(', ')
        render :edit
      end
    end

    def edit; end

    def show; end

    def destroy
      @executive.soft_delete = true
      @executive.save

      flash[:notice] = 'Executive deleted successfully.'
      redirect_to sales_manager_executives_path
    end

    private

    def set_params
      params.require(:executive).permit(
        :full_name,
        :code
      )
    end

    def get_executive
      @executive = Executive.find_by!(id: params[:id])
    end

    def search_executives(search)
      key = "%#{search}%"
      columns = Executive.column_names
      return Executive.where(
        columns.map { |c| "#{c} like :search" }.join(' OR '),
        search: key
      )
    end
  end
end
