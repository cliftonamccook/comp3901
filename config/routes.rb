Rails.application.routes.draw do
  resources :requirement_groups
  resources :minors
  resources :majors
  resources :programmes
  resources :departments
  resources :faculties
  resources :campuses
  devise_for :users
end
