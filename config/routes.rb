Draftboard::Application.routes.draw do
  resources :draft_picks do
    collection do
      post :delete_last_pick
    end    
  end
  
  resources :players do
    collection do
      get :search     
    end
  end
  
  resources :poolies

  resource :poolies do
    member do
      post :randomize_draft_order
    end    
  end  
  
  root :to => "draft_picks#index"
end
