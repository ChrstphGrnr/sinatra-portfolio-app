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
        redirect "/trails/#{trail.id}"
    end
    
    get '/trails/:id' do 
        @trail = Trail.find(params[:id])
        erb :'/trails/show.html'      
    end


    get "/trails/:id/edit" do 
        erb :'trails/edit.html'
    end

    patch "/trails/:id" do
       redirect '/trails/:id'    
    end

end