class InventoryController < ApplicationController
  require 'net/http'
  require 'uri'
  require 'json'

  def show
    uri = URI("http://steamcommunity.com/profiles/" + current_user.uid + "/inventory/json/730/2")

    resp = Net::HTTP.get_response(uri)
    hash = JSON(resp.body)

    @items = Hash.new

    i = 0
    hash['rgInventory'].each do |k, v|
      @items[i] ||= {}
      @items[i][:id] = v['id']
      @items[i][:classid] = v['classid']
      i+=1
    end

    @items.each do |k, v|
      @items[k][:title] = hash['rgDescriptions']["#{v[:classid]}_0"]['market_hash_name']
      @items[k][:icon_url] = hash['rgDescriptions']["#{v[:classid]}_0"]['icon_url']
      @items[k][:tradable] = hash['rgDescriptions']["#{v[:classid]}_0"]['tradable']
    end

  end
end
