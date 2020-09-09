Rails.application.routes.draw do
  root 'home#index'
  devise_for :user, controllers: {
    sessions: 'users/sessions'
  }

  resources :business_loan do
    collection do
    end
  end

  resources :home_loan do
    collection do
    end
  end

  resources :loan_against_property do
    collection do
    end
  end

  resources :new_car_loan do
    collection do
    end
  end

  resources :personal_loan do
    collection do
    end
  end

  resources :professional_loan do
    collection do
    end
  end

  resources :used_car_loan do
    collection do
    end
  end

end
