Draftboard::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :draft_picks do
    collection do
      delete :delete_last
      delete :reset
    end    
  end
  
  resources :players do
    collection do
      get :search     
    end
  end
  
  resources :poolies
  
  root :to => "draft_picks#index"
end
