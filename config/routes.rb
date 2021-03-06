Rails.application.routes.draw do
  resources :kernelperears
  resources :sitefactors
  resources :projlines do
      collection { post :import}
  end
  post 'runscript'   => 'static_pages#runscript'
  root "static_pages#landing"
  get 'results'   => 'static_pages#results'
  get 'download_template', to: "static_pages#download_template"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
