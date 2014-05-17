require 'pushbullet/api/contacts'
require 'pushbullet/api/devices'
require 'pushbullet/api/pushes'
require 'pushbullet/api/users'

module Pushbullet
  module API
    include Contacts
    include Devices
    include Pushes
    include Users
  end
end
