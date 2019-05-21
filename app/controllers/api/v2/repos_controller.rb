class Api::V2::ReposController < ApplicationController
  def index
    response = GithubService.repos(params[:username])
    render json: response.body, status: response.code
  rescue StandardError => e
    render json: e, status: :unprocessable_entity
  end
end
