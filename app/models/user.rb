class User
  attr_reader :data

  def initialize data
    @data = data
  end

  def nickname
    @data['nickname']
  end

  def avatar_url
    @data['image']
  end

  def uid
    @data['uid']
  end

  def profile_url
    @data['profile_url']
  end
end
