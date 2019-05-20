require 'net/http'

class GithubCaller
  class << self

  def public_repos_url_for(username)
    "#{github_client}/users/#{username}/repos"
  end

  private

  def github_client
    ENV["GITHUB_API_HOST"]
  end

  def error_msg(context)
     Rails.logger.error
       "#{self.class.name}: Error #{e} occurred when" + context
  end
end
