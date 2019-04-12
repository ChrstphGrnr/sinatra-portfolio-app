class TrailsController < ApplicationController

    get '/trails/new' do
        if logged_in? 
            erb :'trails/new.html'
        else 
            redirect '/login'
        end
    end

    get '/trails' do 
        erb :'trails/index.html'
    end

    post '/trails' do 
        # binding.pry
        trail = Trail.create(params)
        trail.user_id = current_user.id 
        redirect "/trails/#{trail.id}"
    end
    
    get '/trails/:id' do 
        @trail = Trail.find(params[:id])
        erb :'/trails/show.html'      
    end


    get "/trails/:id/edit" do 
        @trail = Trail.find(params[:id])
        if @trail.user_id == current_user.id 
            erb :'trails/edit.html'
        else  
            redirect '/trails'
        end
    end

    patch "/trails/:id" do
        trail = Trail.find(params[:id])
        trail.update(params)
        redirect '/trails/:id'    
    end

    delete '/trails/:id' do 
        trail = Trail.find(params[:id])
        if trail.id == current_user.id 
            trail.delete
            redirect '/trails'
        else 
            redirect '/trails'
        end
        
    end

end