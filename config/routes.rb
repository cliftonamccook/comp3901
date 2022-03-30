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
  resources :course_records, except: [:destroy, :index, :create]

  devise_for :users, :skip => [:registration], :controllers => { :users => "users" }
  as :user do
    get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
    put 'users' => 'devise/registrations#update', :as => 'user_registration'
  end
  
  resources :users, except: [:destroy] do
    member do
      patch 'activate_account'
      patch 'deactivate_account'
      patch 'reset_password'
    end
  end


  get 'students/course-records', to: 'course_records#index' 
  post 'students/:student_id/course-records', to: 'course_records#create'

  root 'home#index'
end
