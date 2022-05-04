module PersonalAdmin 
  class DisbursementController < ApplicationController
    before_action :get_disbursment, only: [:edit, :show, :destroy, :update]
    before_action :authenticate_user!
    before_action :check_sales_manager
    layout 'personal_admin'

    def index
      @disbursements = Disbursement.all.where('created_at >= ?', 1.week.ago)
    end

    def new
      @disbursement = Disbursement.new
    end

    def create
      @disbursement = Disbursement.new(set_params)

      if @disbursement.save
        flash[:notice] = 'New disbursement created successfully.'
        redirect_to disbursements_path
      else
        flash[:error] = @disbursement.errors.full_messages.join(', ')
        render :new
      end
    end

    def update
      if @disbursement.update_attributes(set_params)
        flash[:notice] = 'Disbursement updated successfully.'
        redirect_to disbursements_path
      else
        flash[:error] = @disbursement.errors.full_messages.join(', ')
        redirect_to :edit
      end
    end

    def edit; end

    def show; end

    def destroy
      @disbursement.destroy
      flash[:notice] = 'Disbursement deleted successfully.'
      redirect_to disbursements_path
    end

    private

    def set_params
      params.require(:disbursement).permit!
    end

    def get_disbursment
      @disbursement = Disbursement.find_by!(id: params[:id])
    end
  end
end
