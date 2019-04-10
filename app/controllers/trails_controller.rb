class TrailsController < ApplicationController

    get '/trails/new' do 
        erb :'trails/new.html'
    end

    get '/trails' do 
        erb :'trails/index.html'
    end
     



end