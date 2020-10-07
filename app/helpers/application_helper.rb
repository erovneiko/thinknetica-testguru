module ApplicationHelper
  def current_year
    Time.now.year
  end

  def github_url(name, author, repo)
    link_to name, "https://github.com/#{author}/#{repo}"
  end
end
