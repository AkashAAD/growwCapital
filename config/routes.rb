Rails.application.routes.draw do
  authenticate :user, lambda { |u| u.admin? } do
    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  end

  ############# SALES MANAGER URL ###########
  get 'sales-manager' => 'personal_admin/home#index'
  get 'personal-admin/home/channel-partner-products' => 'personal_admin/home#get_channel_products'
  get 'personal-admin/home/channel-login-entry' => 'personal_admin/home#get_login_entry'

  get 'sales-manager/disbursements' => 'personal_admin/disbursement#index'
  get 'sales-manager/channel_partner' => 'personal_admin/disbursement#channel_partner_name'
  get 'sales-manager/new-disbursement' => 'personal_admin/disbursement#new'
  get 'sales-manager/disbursement/:id/show' => 'personal_admin/disbursement#show'
  get 'sales-manager/disbursement/:id/edit' => 'personal_admin/disbursement#edit'
  get 'sales-manager/disbursement/:id/destroy' => 'personal_admin/disbursement#destroy'
  post 'sales-manager/create_disbursement' => 'personal_admin/disbursement#create'
  patch 'sales-manager/update_disbursement/:id' => 'personal_admin/disbursement#update'

  get 'sales-manager/channel-partners' => 'personal_admin/channel_partner#index'
  get 'sales-manager/new-channel-partner' => 'personal_admin/channel_partner#new'
  get 'sales-manager/channel-partner/:id/show' => 'personal_admin/channel_partner#show'
  get 'sales-manager/channel-partner/:id/edit' => 'personal_admin/channel_partner#edit'
  get 'sales-manager/channel-partner/:id/destroy' => 'personal_admin/channel_partner#destroy'
  post 'sales-manager/create_channel_partner' => 'personal_admin/channel_partner#create'
  patch 'sales-manager/update_channel_partner/:id' => 'personal_admin/channel_partner#update'

  get 'sales-manager/login-entries' => 'personal_admin/login_entry#index'
  get 'sales-manager/new-login-entry' => 'personal_admin/login_entry#new'
  get 'sales-manager/login-entry/:id/show' => 'personal_admin/login_entry#show'
  get 'sales-manager/login-entry/:id/edit' => 'personal_admin/login_entry#edit'
  get 'sales-manager/login-entry/:id/destroy' => 'personal_admin/login_entry#destroy'
  post 'sales-manager/create_login_entry' => 'personal_admin/login_entry#create'
  patch 'sales-manager/update_login_entry/:id' => 'personal_admin/login_entry#update'

  get 'sales-manager/executives' => 'personal_admin/executive#index'
  get 'sales-manager/new-executive' => 'personal_admin/executive#new'
  get 'sales-manager/executive/:id/show' => 'personal_admin/executive#show'
  get 'sales-manager/executive/:id/edit' => 'personal_admin/executive#edit'
  get 'sales-manager/executive/:id/destroy' => 'personal_admin/executive#destroy'
  post 'sales-manager/create_executive' => 'personal_admin/executive#create'
  patch 'sales-manager/update_executive/:id' => 'personal_admin/executive#update'
  ############# SALES MANAGER URL ###########

  root 'home#index'
  get 'home/change_state' => "home#change_state"
  get "home/car_models" => "home#car_models"
  post "home/instant_call" => "home#instant_call"
  post "home/job_apply" => "home#job_apply"
  post "home/refer_earn" => "home#refer_earn"
  get 'home/check_pincode' => 'home#check_pincode'
  get 'home/change_profession' => "home#change_profession"
  get "home/profile" => "home#profile"
  post 'home/newsletter' => "home#newsletter"
  get "contact_us" => "home#contact_us", as: "contact_us"
  get "about_us" => "home#about_us", as: "about_us"
  get "blog" => "home#blog", as: "blog"
  get "emi_calculator" => "home#emi_calculator", as: "emi_calculator"
  get "pre_approved" => "home#pre_approved", as: "pre_approved"
  post "pre_approved_offer" => "home#pre_approved_offer", as: "pre_approved_offer"
  post "save_contact_us" => "home#save_contact_us", as: "save_contact_us"
  get "pre_approved_status" => "home#pre_approved_status", as: "pre_approved_status"
  post "verfiy_pre_approved" => "home#verfiy_pre_approved", as: "verfiy_pre_approved"
  get "confirm_otp" => "home#confirm_otp", as: "confirm_otp"
  get "thank_you" => "home#thank_you", as: "thank_you"
  get "career" => "home#career", as: "career"
  get "channel_partner" => "home#channel_partner", as: "channel_partner"
  get "terms_and_conditions" => "home#terms_and_conditions", as: "terms_and_conditions"
  get "privacy_policy" => "home#privacy_policy", as: "privacy_policy"

  match "home/credit_card" => "home#credit_card", as: :custom_credit_card, via: [:get, :post]
  match "home/personal_loan" => "home#personal_loan", as: :custom_personal_loan, via: [:get, :post]
  match "home/transfer_personal_loan" => "home#transfer_personal_loan", as: :custom_transfer_personal_loan, via: [:get, :post]
  match "home/business_loan" => "home#business_loan", as: :custom_business_loan, via: [:get, :post]
  match "home/professional_loan" => "home#professional_loan", as: :custom_professional_loan, via: [:get, :post]
  match "home/home_loan" => "home#home_loan", as: :custom_home_loan, via: [:get, :post]
  match "home/transfer_home_loan" => "home#transfer_home_loan", as: :custom_transfer_home_loan, via: [:get, :post]
  match "home/loan_against_property" => "home#loan_against_property", as: :custom_loan_against_property, via: [:get, :post]
  match "home/new_car_loan" => "home#new_car_loan", as: :custom_new_car_loan, via: [:get, :post]
  match "home/used_car_loan" => "home#used_car_loan", as: :custom_used_car_loan, via: [:get, :post]
  match "home/gold_loan" => "home#gold_loan", as: :custom_gold_loan, via: [:get, :post]
  match "home/inssurance" => "home#inssurance", as: :custom_insurance, via: [:get, :post]

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords',
    confirmations: 'users/confirmations'
  }

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end


  resources :business_loan do
    collection do
      post  :create_business_offer
      patch :update_business_offer
      patch :update_business_offer_assets
      post :create_otp
      patch :update_otp_status
      patch :select_bank
      patch :updated_address
      get :resend_otp
    end
  end

  resources :credit_card do
    collection do
      patch :update_card_offer
      patch :update_card_assets
      post :create_otp
      patch :update_otp_status
      patch :select_bank
      patch :update_address
      get :resend_otp
    end
  end

  resources :home_loan do
    collection do
      post  :create_home_offer
      patch :update_home_offer
      patch :update_home_assets
      post :create_otp
      patch :update_otp_status
      patch :select_bank
      patch :update_address
      get :resend_otp
    end
  end

  resources :transfer_home_loan do
    collection do
      post  :create_home_offer
      patch :update_home_offer
      patch :update_home_assets
      post :create_otp
      patch :update_otp_status
      patch :select_bank
      patch :update_address
      get :resend_otp
    end
  end

  resources :loan_against_property do
    collection do
      post  :create_against_property_offer
      patch :update_against_property_offer
      patch :update_against_property_assets
      post :create_otp
      patch :update_otp_status
      patch :update_address
      patch :select_bank
      get :resend_otp
    end
  end

  resources :new_car_loan do
    collection do
      post  :create_new_car_offer
      patch :update_new_car_offer
      patch :update_new_car_assets
      post :create_otp
      patch :update_otp_status
      patch :select_bank
      patch :update_address
      get :resend_otp
    end
  end

  resources :personal_loan do
    collection do
      post  :create_employer
      patch :update_employer
      patch :update_personal_loan_assets
      get :get_employer
      post :create_otp
      patch :update_otp_status
      patch :select_bank
      patch :updated_address
      get :resend_otp
    end
  end

  resources :transfer_personal_loan do
    collection do
      post  :create_employer
      patch :update_employer
      patch :update_transfer_personal_loan_assets
      get :get_employer
      post :create_otp
      patch :update_otp_status
      patch :select_bank
      patch :updated_address
      get :resend_otp
    end
  end

  resources :professional_loan do
    collection do
      post  :create_professional_offer
      patch :update_professional_offer
      patch :update_professional_assets
      post :create_otp
      patch :update_otp_status
      patch :select_bank
      patch :updated_address
      get :resend_otp
    end
  end

  resources :used_car_loan do
    collection do
      post  :create_used_car_offer
      patch :update_used_car_offer
      patch :update_used_car_assets
      post :create_otp
      patch :update_otp_status
      patch :update_address
      patch :select_bank
      get :resend_otp
    end
  end

  resources :payment do
    collection do
      put :create_channel_partner_order
      post :create_channel_partner_payment
      post :friancise_application
    end
  end

end
