class UsersController < ApplicationController

 
  get '/login' do 
    erb :'users/login.html' 
  end


  post '/login' do 
    @user = User.find_by(email: params[:email])
    if !!@user && @user.authenticate(params[:password])
      # binding.pry
      session[:user_id] = @user.id
      redirect "/users/#{@user.id}"
    else
      redirect '/login'
    end
  end


  get '/signup' do 
    erb :'users/new.html'
  end

  
  get "/users" do
    erb :"/users/index.html"
  end

  
  get "/users/new" do
    erb :"/users/signup.html"
  end

 
  post "/users" do
    # binding.pry
    if params[:name] != "" && params[:password] != "" && params[:email] != "" && !User.find_by(email: params[:email])
      User.create(params)
      session[:user_id] = User.last.id
      redirect "/users/#{User.last.id}"
    else 
      redirect '/signup'
    end    
  end

 
  get "/users/:id" do
      if logged_in? 
        erb :"/users/show.html"
      else
        redirect '/login'
      end
  end

 
  get "/users/:id/edit" do
      if logged_in? 
        erb :"/users/edit.html"
      else 
        redirect '/login' 
      end  
  end

 
  patch "/users/:id" do
    redirect "/users/:id"
  end

  
  delete "/users/:id/delete" do
    redirect "/users"
  end


  get '/signout' do 
    session.clear
    erb :'/users/signout.html'
  end
  

  post '/signout' do 
    session.clear
    erb :'/users/signout.html'
  end
  

end
