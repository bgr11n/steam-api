class InventoryController < ApplicationController
  require 'net/http'
  require 'uri'
  require 'json'

  def show
  end

  def load
    uri = URI("http://steamcommunity.com/profiles/" + current_user.uid + "/inventory/json/730/2")

    resp = Net::HTTP.get_response(uri)
    hash = JSON(resp.body)

    items = hash['rgInventory'].map do |k, v|
      tradable = hash['rgDescriptions']["#{v['classid']}_0"]['tradable']
      {
        item_id: v['id'],
        classid: v['classid'],
        title: hash['rgDescriptions']["#{v['classid']}_0"]['market_hash_name'],
        icon_url: 'https://steamcommunity-a.akamaihd.net/economy/image/' +hash['rgDescriptions']["#{v['classid']}_0"]['icon_url']
      } if tradable == 1
    end

    render json: items.compact!
  end
end
