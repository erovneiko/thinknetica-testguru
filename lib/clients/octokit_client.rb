class OctokitClient < Octokit::Client

  def initialize
    super(access_token: ENV['ACCESS_TOKEN'])
  end

  def create_gist(params)
    super(params)
    Faraday::Response.new(last_response.env)
  rescue Octokit::Error
    Faraday::Response.new
  end

end
