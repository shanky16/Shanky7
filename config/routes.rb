Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users,:controllers => { :registrations => 'users',
  :omniauth_callbacks => 'callbacks' }
  root to: 'welcome#index'
  get 'index1', to: 'welcome#index1'
   get 'about', to: 'welcome#about'
   get 'element', to: 'welcome#element'
   get 'contact', to: 'welcome#contact'
   get 'portfolio', to: 'welcome#portfolio'
   #get 'services', to: 'welcome#services'
  get 'show1', to: 'projects#show1'
  get'view1', to: 'projects#view1'
  post'status', to: 'assigns#status'
  post'final_status', to: 'projects#final_status'
  get'image_download', to: 'projects#image_download'
  resources :projects
  resources :assigns
end
