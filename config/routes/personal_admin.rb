Rails.application.routes.draw do
  get 'sales-manager' => 'personal_admin/home#index'
  get 'disbursements' => 'personal_admin/disbursement#index'
  get 'new-disbursement' => 'personal_admin/disbursement#new'
  get 'disbursement/:id/show' => 'personal_admin/disbursement#show'
  get 'disbursement/:id/edit' => 'personal_admin/disbursement#edit'
  get 'disbursement/:id/destroy' => 'personal_admin/disbursement#destroy'
  post 'create_disbursement' => 'personal_admin/disbursement#create'
  patch 'update_disbursement/:id' => 'personal_admin/disbursement#update'
end
