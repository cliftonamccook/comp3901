Rails.application.routes.draw do
  resources :courses, except: [:destroy]
  resources :requirements, except: [:destroy]
  resources :requirement_groups, except: [:destroy]
  resources :minors, except: [:destroy]
  resources :majors, except: [:destroy]
  resources :programmes, except: [:destroy]
  resources :departments, except: [:destroy]
  resources :faculties, except: [:destroy]
  resources :campuses, except: [:destroy]
  devise_for :users

  root 'home#index'
end
