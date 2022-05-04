Rails.application.routes.draw do
  resources :permission_groups
  resources :requirements, except: [:destroy]
  resources :departments, except: [:destroy]
  resources :faculties, except: [:destroy]
  resources :campuses, except: [:destroy]

  devise_for :users, :skip => [:registration], :controllers => { :users => "users" }
  as :user do
    get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
    put 'users' => 'devise/registrations#update', :as => 'user_registration'
  end
  
  resources :courses, except: [:destroy] do 
    patch 'discontinue', on: :member
    patch 'continue', on: :member
    resources :requirement_groups, except: [:destroy]
  end

  resources :programmes, except: [:destroy] do 
    resources :requirement_groups, except: [:destroy]
  end

  resources :minors, except: [:destroy] do 
    resources :requirement_groups, except: [:destroy]
  end
  resources :majors, except: [:destroy] do 
    resources :requirement_groups, except: [:destroy]
  end

  resources :requirement_groups, except: [:destroy] do 
    resources :requirement_groups, except: [:destroy]
  end

  resources :users, except: [:destroy] do
    member do
      patch 'activate_account'
      patch 'deactivate_account'
      patch 'reset_password'
    end
  end

  root 'home#index'
end
