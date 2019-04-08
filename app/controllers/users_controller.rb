class UsersController < ApplicationController

  # GET /login

  get '/login' do 
    erb :'users/login.html' 
  end

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
    redirect "/users"
  end

  # GET: /users/5
  get "/users/:id" do
    @user = User.find_by(id: session[:user_id])
    erb :"/users/show.html"
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
end
