require 'pushbullet/client'

module Pushbullet
  def self.client(api_key)
    Client.new(api_key)
  end
end
