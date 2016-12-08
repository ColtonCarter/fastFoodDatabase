Rails.application.routes.draw do

  
  get 'front_page/index'

  get 'home/homepage'

   # these routes are for showing users a login form, logging them in, and logging them out.
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get 'people/reportRead'
  get 'employees/reportRead'
  get 'invoices/reportRead'
  get 'products/reportRead'
  get 'report/index'

  get 'people/userCreateEditRead'
  get 'phones/userCreateEditRead'
  get 'emails/userCreateEditRead'

  get 'invoices/userCreateRead'

  get 'invoice_has_products/userCreate'
  get 'customers/userCreate'

  get 'products/userRead'

  get 'people/adminCreateEditRead'
  get 'phones/adminCreateEditRead'
  get 'emails/adminCreateEditRead'

  get 'invoices/adminCreateRead'

  get 'invoice_has_products/adminCreate'
  get 'customers/adminCreate'

  get 'products/adminRead'

  get 'user/index'
  get 'user/adminIndex'


  get 'admin/index'

  get 'homepage/index'

  get 'people/userNew'
  get 'people/userEdit'
  get 'phones/userNew'
  get 'phones/userEdit'
  get 'emails/userNew'
  get 'emails/userEdit'
  get 'invoices/userNew'
  get 'invoice_has_products/userNew'


   root 'homepage#index'


     # These routes will be for signup. The first renders a form in the browse, the second will 
    # receive the form and create a user in our database using the data given to us by the user.
  get '/signup' => 'users#new'
  post '/users' => 'users#create'
    
  resources :invoice_has_products
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
