class TrailsController < ApplicationController

    get '/trails/new' do 
        erb :'trails/new.html'
    end

    get '/trails' do 
        erb :'trails/index.html'
    end

    post '/trails' do 
        binding.pry
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
        if @trail.user_id = current_user.id 
            erb :'trails/edit.html'
        else  
            redirect '/trails'
        end
    end

    patch "/trails/:id" do
       redirect '/trails/:id'    
    end

end