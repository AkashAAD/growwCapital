module PersonalAdmin
  class BankController < ApplicationController
    before_action :get_bank, only: [:edit, :show, :destroy, :update]
    before_action :check_accountant
    before_action :authenticate_user!
    layout 'personal_admin'

    def index
      @banks = Bank.all
      @banks = search_banks(params[:search]) if params[:search].present?
      @banks = @banks.order(id: :desc).paginate(page: params[:page], per_page: 10)
    end

    def new
      @bank = Bank.new
    end

    def create
      @bank = Bank.new(set_params)

      if @bank.save
        flash[:notice] = 'New bank created successfully.'
        redirect_to sales_manager_banks_path
      else
        flash[:error] = @bank.errors.full_messages.join(', ')
        render :new
      end
    end

    def update
      if @bank.update(set_params)
        flash[:notice] = 'bank updated successfully.'
        redirect_to sales_manager_banks_path
      else
        flash[:error] = @bank.errors.full_messages.join(', ')
        render :edit
      end
    end

    def edit; end

    def show; end

    def destroy
      @bank.destroy
      flash[:notice] = 'bank deleted successfully.'
      redirect_to sales_manager_banks_path
    end

    private

    def set_params
      params.require(:bank).permit(:name)
    end

    def get_bank
      @bank = Bank.find_by!(id: params[:id])
    end

    def search_banks(search)
      key = "%#{search}%"
      columns = Bank.column_names
      return Bank.where(
        columns.map { |c| "#{c} like :search" }.join(' OR '),
        search: key
      )
    end
  end
end

