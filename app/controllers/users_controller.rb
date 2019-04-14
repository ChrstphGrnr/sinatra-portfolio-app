class UsersController < ApplicationController
  
  get '/login' do 
    erb :'users/login.html' 
  end


  post '/login' do 
    @user = User.find_by(email: params[:email])
    if !!@user && @user.authenticate(params[:password])
      # binding.pry
      session[:user_id] = @user.id
      flash[:message] = "Welcome back #{@user.name}!"
      redirect "/users/#{@user.id}"
    else
      flash[:error] = "Your credentials were invalid. Please log in or sign up."
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
      flash[:message] = "Welcome #{User.last.name} to the Trail Collector!"
      redirect "/users/#{User.last.id}"
    else 
      flash[:error] = "You did not fill out all the required fields. Please fill out all required information."
      redirect '/signup'
    end    
  end

 
  get "/users/:id" do
      if logged_in? 
        erb :"/users/show.html"
      else
        flash[:error] = "You are not logged in, please log in to view your page."
        redirect '/login'
      end
  end

 
  get "/users/:id/edit" do
    if logged_in? 
      erb :"/users/edit.html"
    else 
      flash[:error] = "You are not logged in, please log in to edit your information."
      redirect '/login' 
    end  
  end

 
  patch "/users/:id" do
    if logged_in? && current_user.id == params[:id]
      flash[:message] = "You succesfully updated your profile information."
      redirect "/users/:id"
    else 
      flash[:error] = "You do not have permission to edit this user."
      redirect '/login'
    end
  end

  
  delete "/users/:id/delete" do
    if logged_in? && current_user.id == params[:id]
      user = user.find_by(id: params[:id])
      user.trails.each do |t|
        t.delete
      end
      user.delete
      flash[:message] = "Successfully deleted #{user.name} and all associated trails."
      redirect "/users"
    else 
      flash[:warning] = "You do not have permission to delete this user."
      redirect '/login'
    end
  end


  get '/signout' do 
    flash[:message] = "See you soon #{current_user.name}"
    session.clear
    redirect '/'
  end
  

  post '/signout' do 
    flash[:message] = "See you soon #{current_user.name}"
    session.clear
    redirect '/'
  end

  

end
