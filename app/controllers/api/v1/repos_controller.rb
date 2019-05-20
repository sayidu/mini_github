class Api::V1::ReposController < ApplicationController

  def index
    response = GithubService.repos(params[:username])
    render json: response.body, status: :ok
  rescue StandardError => e
    render json: e, status: :unprocessable_entity
  end

  def create; end

  private

  def user_params; end

  def repo_params
    params.require(:repo).permit(:name, :description, :homepage, :private)
  end
end
