# frozen_string_literal: true

class Api::V1::ReposController < ApplicationController
  def index
    url = GithubCalls.public_repos_url_for(username)
    res = Net::HTTP.get_response(URI(url))
    render json: res.body, status: :ok
  end
end
