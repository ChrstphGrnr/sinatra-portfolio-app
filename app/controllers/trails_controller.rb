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
        filename = params[:file][:filename]
        file = params[:file][:tempfile]

        trail = Trail.create(name: params[:name], description: params[:description], user_id: current_user.id, image: params[:file][:filename])
        
        File.open("public/images/#{filename}", 'wb') do |f|
            f.write(file.read)
        end
        
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
        trail = Trail.find_by(id: params[:id])
        trail.update(name: params[:name], description: params[:description])
        redirect "/trails/#{trail.id}"    
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