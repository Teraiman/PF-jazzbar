Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :admins
  devise_for :customers


  ########## 管理者 ##########
  namespace :admin do

  #管理者/アーティスト
    resources :artists, only: [:index, :edit]

  #管理者/予約
    resources :reserves, only: [:new, :index, :show, :edit]

  #管理者/スケジュール
    resources :schedules, only: [:new, :index, :show, :edit]
    get 'schedules/index_list', to: 'schedules#index_list'

  #管理者/ハウスルール
    get 'house_rules/index'

  #管理者/インフォメーション
    resources :informations, only: [:new, :index, :show, :edit]

  #管理者/会員
    resources :customers, only: [:index, :show, :edit]
    get 'customers/quit', to: 'customers#quit'
    get 'customers/quitcheck', to: 'customers#quitcheck'
    get 'customers/edit_memo', to: 'customers#edit_memo'

  #管理者/ホーム
    get 'homes/top', to: 'homes#top'
    get 'homes/about', to: 'homes#about', as: 'about'
    get 'homes/access', to: 'homes#access', as: 'access'
  end
  ########## 管理者 ##########

  ########## 会員 ##########
  namespace :customer do
  #会員/アーティスト
    get 'artists/index'

  #会員/予約
    resources :reserves, only: [:new, :index, :show]
    get 'reserves/finish', to: 'reserves#finish'

  #会員/スケジュール
    resources :schedules, only: [:index, :show]
    get 'schedules/index_list'

  #会員/ハウスルール
    get 'house_rules/index'

  #会員/インフォメーション
    resources :informations, only: [:index, :show]

  #会員/会員
    resources :customers, only: [:show, :edit]
    get 'customers/quit', to: 'customers#quit'
    get 'customers/quitcheck', to: 'customers#quitcheck'

  #会員/ホーム
    root to: 'homes#top'
    get 'homes/about', to: 'homes#about', as: 'about'
    get 'homes/access', to: 'homes#access', as: 'access'
  end
  ########## 会員 ##########
  #notification項目の有無？
end
