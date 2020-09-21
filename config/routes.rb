Rails.application.routes.draw do
  root 'home#index'
  devise_for :user, controllers: {
    sessions: 'users/sessions'
  }

  resources :business_loan do
    collection do
      post  "create_business_offer"
      patch "update_business_offer"
      patch "update_business_offer_assets"
    end
  end

  resources :home_loan do
    collection do
      patch "update_home_loan_assets"
    end
  end

  resources :loan_against_property do
    collection do
      post  "create_against_property_offer"
      patch "update_against_property_offer"
      patch "update_against_property_assets"
    end
  end

  resources :new_car_loan do
    collection do
    end
  end

  resources :personal_loan do
    collection do
      post  "create_employer"
      patch "update_employer"
      patch "update_personal_loan_assets"
    end
  end

  resources :professional_loan do
    collection do
      post  "create_professional_offer"
      patch "update_professional_offer"
      patch "update_professsional_assets"
    end
  end

  resources :used_car_loan do
    collection do
    end
  end

end
