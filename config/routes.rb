Rails.application.routes.draw do
  root 'home#index'
  get 'home/change_state' => "home#change_state"
  devise_for :user, controllers: {
    sessions: 'users/sessions'
  }

  resources :business_loan do
    collection do
      post  :create_business_offer
      patch :update_business_offer
      patch :update_business_offer_assets
      post :create_otp
      patch :update_otp_status
    end
  end

  resources :home_loan do
    collection do
      post  :create_home_offer
      patch :update_home_offer
      patch :update_home_assets
      post :create_otp
      patch :update_otp_status
    end
  end

  resources :loan_against_property do
    collection do
      post  :create_against_property_offer
      patch :update_against_property_offer
      patch :update_against_property_assets
      post :create_otp
      patch :update_otp_status      
    end
  end

  resources :new_car_loan do
    collection do
      post  :create_new_car_offer
      patch :update_new_car_offer
      patch :update_new_car_assets
      post :create_otp
      patch :update_otp_status
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
    end
  end

  resources :professional_loan do
    collection do
      post  :create_professional_offer
      patch :update_professional_offer
      patch :update_professional_assets
      post :create_otp
      patch :update_otp_status
    end
  end

  resources :used_car_loan do
    collection do
      post  :create_used_car_offer
      patch :update_used_car_offer
      patch :update_used_car_assets
      post :create_otp
      patch :update_otp_status
    end
  end

end
