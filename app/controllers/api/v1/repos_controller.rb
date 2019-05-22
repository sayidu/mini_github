class Api::V1::ReposController < ApplicationController
  def index
    response = GithubRequestsJob.perform_now('repos', params[:username])
    render json: response.body, status: response.code
  rescue StandardError => e
    render json: e, status: :unprocessable_entity
  end

  def create
    response = GithubRequestsJob.perform_now('create_repo', params[:repo])
    render json: response.body, status: response.code
  rescue StandardError => e
    render json: e.errors, status: :unprocessable_entity
  end

  def destroy
    response = GithubRequestsJob.perform_now('delete_repo', params)
    render json: response.body, status: response.code
  rescue StandardError => e
    render json: e, status: response
  end

  private

  def repo_params
    params.require(:repo).permit(:name, :description, :homepage, :private)
  end
end
