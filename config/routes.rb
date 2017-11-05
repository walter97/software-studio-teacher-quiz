Rails.application.routes.draw do
  
  root :to => redirect('/access/home')
  
  get 'access/home', :to => 'access#home'
  get 'home', :to => 'access#home'
  get 'admin', :to => 'access#menu'
  get 'access/menu'
  get 'access/login'
  post 'access/attempt_login'
  get 'access/logout'
  get 'access/accountType'
  

  post 'students/signup', :to => 'students#register'
  get 'students/signup', :to => 'students#signup'
  
  resources :courses
  
  resources :students do
    collection do
      get :quiz
      post :quiz, :to => "students#check_answer"
    end
  end
  
  resources :teachers

end
