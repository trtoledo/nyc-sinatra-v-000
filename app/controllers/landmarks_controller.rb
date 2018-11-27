class LandmarksController < ApplicationController
  # add controller methods

  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'/landmarks/index'
  end

  get '/landmarks/new' do
    erb :'/landmarks/new'
  end

  post '/landmarks' do
    @landmark = Landmark.create(params[:landmark])
    if !params["figure"]["name"].empty?
      @landmark.figures << Figure.create(name: params["figure"]["name"])
    end
    if !params["title"]["name"].empty?
      @figure.titles << Title.create(name: params["title"]["name"])
    end
    @landmark.save
    redirect "/landmarks/#{@landmark.id}"
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/edit'
  end

  patch '/landmarks/:id' do
    # binding.pry
    @landmark = Landmark.find(params[:id])
    @landmark.update(params[:landmark])
    if !params[:figure][:name].empty?
      @landmark.figures << Figure.create(params[:figure])
    end
    if !params[:title][:name].empty?
      @landmark.titles << Title.create(params[:title])
    end
    @landmark.save
    redirect to "/landmarks/#{@landmark.id}"
  end

end
