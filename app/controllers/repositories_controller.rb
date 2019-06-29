class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp  = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['q'] = params['query']
        req.params['sort'] = 'stars'
    end
    body = JSON.parse(@resp.body)
    if @resp.success?
      @items = body["items"]
    else
      @error = "Something went wromg. please try again."
    end
    render 'search'
  end

  def foursquare
    @resp = Faraday.get 'https://api.foursquare.com/v2/venues/search' do |req|
    req.params['client_id'] = 'CJGCTTS3OQAQZO2XI2TWVB0TY0WH0FJHRF4S2E1QKCJ1HVFH'
    req.params['client_secret'] = 'VSTNKEYLJPEBCQZQKQ4UCADWSQCHVZFZ5EKKCTPMKU1RJTFZ'
    req.params['v'] = '20160201'
    req.params['near'] = params[:zipcode]
    req.params['query'] = 'coffee shop'
  end
  body = JSON.parse(@resp.body)
  if @resp.success?
    @venues = body["response"]["venues"]
  else
    @error = body["meta"]["errorDetail"]
  end
  render 'search'
  end
end
