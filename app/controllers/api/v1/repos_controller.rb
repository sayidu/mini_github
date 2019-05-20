class Api::V1::ReposController < ApplicationController
  def index
    url = GithubCaller.public_repos_url_for(params[:username])
    res = Net::HTTP.get_response(url)
    render json: res.body, status: :ok
  rescue StandardError => e
    render json: e.body, status: :unprocessable_entity
  end

  def create; end

  private

  def user_params; end

  def repo_params
    params.require(:repo).permit(:name, :description, :homepage, :private)
  end
end
