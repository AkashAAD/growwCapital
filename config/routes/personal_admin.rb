Rails.application.routes.draw do
  get 'sales-manager' => 'personal_admin/home#index'

  get 'sales-manager/disbursements' => 'personal_admin/disbursement#index'
  get 'sales-manager/channel_partner' => 'personal_admin/disbursement#channel_partner_name'
  get 'sales-manager/new-disbursement' => 'personal_admin/disbursement#new'
  get 'sales-manager/disbursement/:id/show' => 'personal_admin/disbursement#show'
  get 'sales-manager/disbursement/:id/edit' => 'personal_admin/disbursement#edit'
  get 'sales-manager/disbursement/:id/destroy' => 'personal_admin/disbursement#destroy'
  post 'sales-manager/create_disbursement' => 'personal_admin/disbursement#create'
  patch 'sales-manager/update_disbursement/:id' => 'personal_admin/disbursement#update'
end
