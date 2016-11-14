Rails.application.routes.draw do
<<<<<<< HEAD
   root 'welcome#index'
=======
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
  get 'welcome/index'
>>>>>>> origin/master

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
