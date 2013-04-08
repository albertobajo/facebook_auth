Rails.application.routes.draw do
  match '/auth/facebook/callback', to: 'facebook_auth/sessions#create'
  match '/auth/facebook/logout', to: 'facebook_auth/sessions#destroy'
end
