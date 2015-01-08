class InventoryController < ApplicationController
  require 'net/http'
  require 'uri'
  require 'json'

  def show
    uri = URI("http://steamcommunity.com/profiles/" + current_user.uid + "/inventory/json/730/2")

    resp = Net::HTTP.get_response(uri)
    hash = JSON(resp.body)

    @items = Hash.new
    hash['rgDescriptions'].each do |k, v|
      @items[k] ||= {}
      @items[k][:id] = v['classid']
      @items[k][:title] = v['market_hash_name']
      @items[k][:icon_url] = v['icon_url']
      @items[k][:tradable] = v['tradable']
    end

  end
end
