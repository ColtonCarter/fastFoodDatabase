Rails.application.routes.draw do

   # these routes are for showing users a login form, logging them in, and logging them out.
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get 'report/index'

  get 'user/index'

  get 'admin/index'

  get 'homepage/index'

   root 'sessions#new'


     # These routes will be for signup. The first renders a form in the browse, the second will 
    # receive the form and create a user in our database using the data given to us by the user.
  get '/signup' => 'users#new'
  post '/users' => 'users#create'
    
  resources :statuses
  resources :shifts
  resources :products
  resources :positions
  resources :phones
  resources :people
  resources :invoices
  resources :employee_has_shifts
  resources :employees
  resources :emails
  resources :customers



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
