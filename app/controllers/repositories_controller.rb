class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    client_id = "fb92150188f8f57a5e42"
    secret = "09ef41c7be06c6215c415dd3ed59ab161356d1d6"

    resp = Faraday.get("https://api.github.com/search/repositories") do |r|
      r.params["q"] = params[:query]
      r.params["client_id"] = client_id
      r.params["client_secret"] = secret
    end

    body = JSON.parse(resp.body)
    @results = body["items"]
    render :search
  end
end
