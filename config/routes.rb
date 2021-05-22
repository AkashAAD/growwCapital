Rails.application.routes.draw do
  root 'home#index'
  get 'home/change_state' => "home#change_state"
  get "home/car_models" => "home#car_models"
  post "home/instant_call" => "home#instant_call"
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

end
