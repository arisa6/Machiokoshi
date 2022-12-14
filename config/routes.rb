Rails.application.routes.draw do
  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  
  root to: 'public/homes#top'
  get 'public/homes/about' => 'public/homes#about', as: 'about'
  
    scope module: :public do
    resources :addresses, only:[:index,:edit,:create,:update,:destroy]
    resources :orders, only:[:new,:index,:show,:create]do
      collection do
        post :confirm
        get :complete
      end
    end
    
    resources :cart_items, only:[:index,:create,:update,:destroy] do
      collection do
        delete :destroy_all
      end
    end

    resources :customers, only:[:show,:edit,:update] do
      collection do
        get :unsubscribe
        patch :withdrawl
      end
    end

    resources :items, only:[:index,:show]
    # resource :favorites, only: [:create, :destroy]　実装予定
    resources :genres, only:[:show]

  end
  
  
  namespace :admin do
    root to: 'homes#top'
    
    
    resources :makings, only:[:update]
    resources :orders, only:[:edit,:update,:show]
    get "orders/history/:id" => "orders#history", as: "order_history"
    resources :order_details, only: [:update] 
    resources :customers, only:[:index,:show,:edit,:update]
    resources :genres, only:[:index,:create,:edit,:update, :destroy]
    resources :items, only:[:index,:show,:new,:create,:edit,:update,:destroy]
    delete 'items/:id'  => 'items#destroy', as: "items_destroy"
  end

end
