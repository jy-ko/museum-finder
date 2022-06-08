class MuseumsController < ApplicationController
  def index
    latitude = params[:lat]
    longitude = params[:lng]
    @response = RestClient.get "https://api.mapbox.com/geocoding/v5/mapbox.places/museum.json?type=poi&proximity=#{longitude},#{latitude}&access_token=#{ENV["MAPBOX_API_KEY"]}", 
    {accept: :json}
    @museums = JSON.parse(@response.body)["features"].map {|m| {code: m['context'][0]['text'], name: m['text'] }}
    render json: @museums
  end 
end

