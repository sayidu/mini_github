require 'net/http'

class Api::V1::ReposController < ApplicationController
  def index
    uri =  URI('/users/params[:username]/repos')
    res = Net::HTTP.get_response(uri)
    puts res.body
  end
end
