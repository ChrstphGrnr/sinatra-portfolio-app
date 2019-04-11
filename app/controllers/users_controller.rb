class UsersController < ApplicationController

 

  # GET /login
  get '/login' do 
    erb :'users/login.html' 
  end

  # POST /login
  post '/login' do 
    # binding.pry
    
    @user = User.find_by(email: params[:email])
    if !!@user && @user.authenticate(params[:password])
      # binding.pry
      session[:user_id] = @user.id
      redirect "/users/#{@user.id}"
    else
      redirect '/login'
    end
  end

  # GET /signup
  get '/signup' do 
    erb :'users/new.html'
  end

  
  # GET: /users
  get "/users" do
    erb :"/users/index.html"
  end

  # GET: /users/new
  get "/users/new" do
    erb :"/users/signup.html"
  end

  # POST: /users
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

  # GET: /users/5
  # make sure only your showpage is shown and not others!
  get "/users/:id" do
    if logged_in? 
      erb :"/users/show.html"
    else 
      erb :'/users/login.html'
    end
  end

  # GET: /users/5/edit
  # make sure you can only edit your own page and not others!
  get "/users/:id/edit" do
    erb :"/users/edit.html"
  end

  # PATCH: /users/5
  patch "/users/:id" do
    redirect "/users/:id"
  end

  # DELETE: /users/5/delete
  # make sure you can only delete your own page and not others! HELPER METHOD !
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
