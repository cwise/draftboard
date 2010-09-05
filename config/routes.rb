Draftboard::Application.routes.draw do
  resources :draft_picks
  
  resources :poolies

  resource :poolies do
    member do
      post :randomize_draft_order
    end    
  end  
  
  root :to => "draft_picks#index"
end
