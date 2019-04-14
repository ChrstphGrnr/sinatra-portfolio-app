class TrailsController < ApplicationController
    

    get '/trails/new' do
        if logged_in? 
            erb :'trails/new.html'
        else 
            flash[:error] = "You need to be logged in to create a new trail."
            redirect '/login'
        end
    end

    get '/trails' do 
        erb :'trails/index.html'
    end

    post '/trails' do 
        binding.pry
        if !params.empty?
            if params[:file]
                filename = params[:file][:filename]
                file = params[:file][:tempfile]
                trail = Trail.create(name: params[:name], description: params[:description], user_id: current_user.id, image: params[:file][:filename])
                File.open("public/images/#{filename}", 'wb') do |f|
                    f.write(file.read)
                end
            else
                trail = Trail.create(name: params[:name], description: params[:description], user_id: current_user.id)
            end
            redirect "/trails/#{trail.id}"
        else 
            flash[:error] = "You did not enter enough information to create a new trail."
            redirect '/trails/new'
        end

    end
    
    get '/trails/:id' do 
        @trail = Trail.find(params[:id])
        erb :'/trails/show.html'      
    end


    get "/trails/:id/edit" do 
        @trail = Trail.find(params[:id])
        if @trail && logged_in? && @trail.user_id == current_user.id 
            erb :'trails/edit.html'
        else
            flash[:error] = "You do not have permission to edit this trail."  
            redirect '/trails'
        end
    end


    patch "/trails/:id" do
        trail = Trail.find_by(id: params[:id])
        if logged_in? && trail.user_id == current_user.id
            trail.update(name: params[:name], description: params[:description])
            flash[:message] = "Successfully updated #{trail.name}."
            redirect "/trails/#{trail.id}"  
        else 
            flash[:error] = "You do not have permission to edit this trail."
            redirect 'trails' 
        end 
    end

    delete '/trails/:id' do 
        trail = Trail.find(params[:id])
        if trail.user_id == current_user.id 
            trail.delete
            flash[:message] = "Successfully deleted #{trail.name}."
            redirect '/trails'
        else 
            flash[:error] = "You do not have permission to delete this trail."
            redirect '/trails'
        end
        
    end

end