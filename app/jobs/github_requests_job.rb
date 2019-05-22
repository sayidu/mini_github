class GithubRequestsJob < ApplicationJob
  queue_as :default

  def perform(method_name, *request_params)
    GithubService.send method_name.to_s, *request_params
  end
end