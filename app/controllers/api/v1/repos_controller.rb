require 'net/http'

class Api::V1::ReposController < ApplicationController
  def index
    uri = URI("https://api.github.com/users/#{params[:username]}/repos")
    res = Net::HTTP.get_response(uri)
    render json: res.body, status: :ok
  end
end
