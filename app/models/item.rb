class Item

  attr_reader :data

  def initialize data
    @data = data
  end

  def item_id
    @data[:item_id]
  end

  def classid
    @data[:classid]
  end

  def title
    @data[:title]
  end

  def icon_url
    @data[:icon_url]
  end

  def tradable
    @data[:tradable]
  end
end
