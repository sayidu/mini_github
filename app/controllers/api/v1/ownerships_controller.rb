class Api::V1::OwnershipsController < ApplicationController
  def create
    response = GithubService.transfer_repo(ownership_params, transfer_params)
    render json: response.body, status: response.code
  rescue StandardError => e
    render json: e, status: :unprocessable_entity
  end

  def show
    response = GithubService.get_repo(ownership_params)
    render json: response.body, status: response.code
  rescue StandardError => e
    render json: e, status: :unprocessable_entity
  end

  private

  def ownership_params
    {
      owner: params[:owner],
      repo: params[:repo]
    }
  end

  def transfer_params
    {
      new_owner: params[:new_owner]
    }
  end
end
