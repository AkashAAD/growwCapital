module PersonalAdmin
  class LoginEntryController < ApplicationController
    before_action :get_login_entry, only: [:edit, :show, :destroy, :update]
    before_action :check_sales_manager, only: [:create, :new, :destroy, :edit, :update]
    before_action :authenticate_user!
    before_action :check_admin_manager
    layout 'personal_admin'

    def index
      if current_user&.sales_manager?
        @login_entries = sales_manager_login_entries
      else
        @login_entries = []
      end

      search_login_entries

      respond_to do |format|
        format.html
        format.xlsx
      end
    end

    def new
      @login_entry = LoginEntry.new
    end

    def create
      @login_entry = LoginEntry.new(set_params)
      @login_entry.channel_partner = set_channel_partner
      @login_entry.channel_partner_type = set_channel_partner_type
      @login_entry.user = current_user
      @login_entry.reference_contacts << ReferenceContact.new(reference_params['0'])
      @login_entry.reference_contacts << ReferenceContact.new(reference_params['1'])
      @login_entry.reference_contacts << ReferenceContact.new(reference_params['2'])

      if @login_entry.save
        flash[:notice] = 'New disbursement created successfully.'
        redirect_to sales_manager_login_entries_path
      else
        flash[:error] = @login_entry.errors.full_messages.join(', ')
        render :new
      end
    end

    def update
      redirect_to sales_manager_login_entries_path if @login_entry.payment

      @login_entry.channel_partner = set_channel_partner
      @login_entry.channel_partner_type = set_channel_partner_type
      @login_entry.approved = params[:login_entry][:approved] ? true : false
      @login_entry.rejected = params[:login_entry][:rejected] ? true : false
      @login_entry.reference_contacts.destroy_all

      @login_entry.reference_contacts << ReferenceContact.new(reference_params['0'])
      @login_entry.reference_contacts << ReferenceContact.new(reference_params['1'])
      @login_entry.reference_contacts << ReferenceContact.new(reference_params['2'])


      if @login_entry.update(set_params)
        flash[:notice] = 'Login Entry updated successfully.'
        redirect_to sales_manager_login_entries_path
      else
        flash[:error] = @login_entry.errors.full_messages.join(', ')
        render :edit
      end
    end

    def edit
      redirect_to sales_manager_login_entries_path if @login_entry.payment
    end

    def show; end

    def destroy
      @login_entry.destroy
      flash[:notice] = 'Login Entry deleted successfully.'
      redirect_to sales_manager_login_entries_path
    end

    private

    def set_params
      params.require(:login_entry).permit(
        :customer_full_name,
        :business_name,
        :mobile_number,
        :email,
        :state,
        :city,
        :channel_partner_product_id,
        :customer_id,
        :dob,
        :process_date,
        :executive_id,
        :bank_id,
        :loan_amount,
        :notes
      )
    end

    def reference_params
      params.require(:login_entry).permit(reference: [:full_name, :mobile_number, :profile])[:reference]
    end

    def get_login_entry
      @login_entry = LoginEntry.find_by!(id: params[:id])
    end

    def set_channel_partner
      ChannelPartner.find_by(id: params[:login_entry][:channel_partner])
    end

    def set_channel_partner_type
      ChannelPartnerType.find_by(id: params[:login_entry][:channel_partner_type])
    end

    def sales_manager_login_entries
      @login_entries = current_user
        .login_entries.where('payment_date >= ? OR payment_date is null', 1.day.ago)
      if params[:rejected] == 'true'
        @login_entries.where(rejected: true)
      else
        @login_entries.where(rejected: false)
      end
    end

    def search_login_entries
      @corrdinators = User.joins(:role)
        .where('roles.name = ? || roles.name = ?', 'sales_manager', 'admin')
        .where('users.profession IS NULL || users.profession != ?', 'developer')
        .map {|rr| [rr.full_name, rr.id] }

      if params[:cordinator].present?
        @login_entries = LoginEntry.where(user_id: params[:cordinator])
      end

      if params[:from_date].present? && params[:to_date].present?
        if params[:from_date]&.to_date <= params[:to_date]&.to_date
          if params[:cordinator].present?
            @login_entries = @login_entries.where(created_at: params[:from_date].to_date.beginning_of_day..params[:to_date].to_date.end_of_day)
          else
            return flash[:warning] = 'Please select co-ordinator.'
          end
        else
          return flash[:warning] = 'From date should be less than to date.'
        end
      end

      if params[:paid_unpaid].present?
        if params[:cordinator].present?
          @login_entries = @login_entries.where(payment: params[:paid_unpaid])
        else
          return flash[:warning] = 'Please select co-ordinator.'
        end
      end

      if params[:approved_unapproved].present?
        if params[:cordinator].present?
          @login_entries = @login_entries.where(approved: params[:approved_unapproved])
        else
          return flash[:warning] = 'Please select co-ordinator.'
        end
      end

      if params[:reject_unreject].present?
        if params[:cordinator].present?
          @login_entries = @login_entries.where(rejected: params[:reject_unreject])
        else
          return flash[:warning] = 'Please select co-ordinator.'
        end
      end

      if params[:search].present?
        key = "%#{params[:search]}%"
        columns = LoginEntry.column_names
        @login_entries = LoginEntry.where(
          columns.map { |c| "#{c} like :search" }.join(' OR '),
          search: key
        )
      end

      return @login_entries && request.format = 'xlsx' if params[:xls] == 'xls'

      @login_entries = @login_entries.order(id: :desc).paginate(page: params[:page], per_page: 10) unless @login_entries.blank?
    end
  end
end
