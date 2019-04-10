class UsersController < ApplicationController

 

  # GET /login
  get '/login' do 
    erb :'users/login.html' 
  end

  # POST /login
  post '/login' do 
    # binding.pry
    @user = User.find_by(email: params[:email])
    if @user.authenticate(params[:password])
      # binding.pry
      session[:user_id] = @user.id
      redirect "/users/#{@user.id}"
    else
      redirect '/login'
    end
  end

  # GET /signup

  get '/signup' do 
    erb :'users/signup.html'
  end

  
  # GET: /users
  get "/users" do
    erb :"/users/index.html"
  end

  # GET: /users/new
  get "/users/new" do
    erb :"/users/new.html"
  end

  # POST: /users
  post "/users" do
    # binding.pry
    if params[:name] != "" && params[:password] != "" && params[:email] != ""
      User.create(params)
      session[:user_id] = User.last.id
      redirect "/users/#{User.last.id}"
    else 
      redirect '/signup'
    end    
  end

  # GET: /users/5
  get "/users/:id" do
    if logged_in? 
      erb :"/users/show.html"
    else 
      erb :'/users/login.html'
    end
  end

  # GET: /users/5/edit
  get "/users/:id/edit" do
    erb :"/users/edit.html"
  end

  # PATCH: /users/5
  patch "/users/:id" do
    redirect "/users/:id"
  end

  # DELETE: /users/5/delete
  delete "/users/:id/delete" do
    redirect "/users"
  end

  

  get '/signout' do 
    erb :'/users/signout.html'
  end
  

  post '/signout' do 
    session.clear 
    redirect '/signout'
  end

end
