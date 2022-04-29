Rails.application.routes.draw do
  get 'sales-manager' => "personal_admin/home#index"
end
