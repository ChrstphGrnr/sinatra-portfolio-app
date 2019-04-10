class TrailsController < ApplicationController

    get '/trails/new' do 
        erb :'trails/new.html'
    end

    get '/trails' do 
        erb :'trails/index.html'
    end

    get "/trails/:id/edit" do 
        erb :'trails/edit.html'
    
    end

    patch "/trails/:id" do
       redirect '/trails/:id'    
    end

end