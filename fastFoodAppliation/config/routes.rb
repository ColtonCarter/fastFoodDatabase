Rails.application.routes.draw do

  get 'report/index'

  get 'user/index'

  get 'admin/index'

  get 'homepage/index'

   root 'welcome#index'

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


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
