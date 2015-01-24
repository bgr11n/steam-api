class InventoryController < ApplicationController
  require 'net/http'
  require 'uri'
  require 'json'

  def show
  end

  def load
    uri = URI(current_user.profile_url + "/inventory/json/730/2")

    resp = Net::HTTP.get_response(uri)
    hash = JSON(resp.body)

    items = hash['rgInventory'].map do |k, v|

      tradable = hash['rgDescriptions']["#{v['classid']}_#{v['instanceid']}"]['tradable']
      {
        item_id: v['id'],
        classid: v['classid'],
        title: hash['rgDescriptions']["#{v['classid']}_#{v['instanceid']}"]['market_hash_name'],
        icon_url: 'https://steamcommunity-a.akamaihd.net/economy/image/' +hash['rgDescriptions']["#{v['classid']}_#{v['instanceid']}"]['icon_url']
      } if tradable == 1

    end

    render json: items.compact!
  end
end
