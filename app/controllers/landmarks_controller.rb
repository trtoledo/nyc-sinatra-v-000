class LandmarksController < ApplicationController
  # add controller methods

  get '/lamdmarks' do
    @landmarks = Landmark.all
    erb :'/landmarks/index.erb'
  end

  get '/landmarks/new' do
    erb :'/landmarks/new.erb'
  end

  
end
